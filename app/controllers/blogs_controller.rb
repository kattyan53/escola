class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]

  def index
    @search = Blog.ransack(params[:q])
    @blogs = @search.result
    @blogs = Blog.page(params[:page]).per(40)
  end

  def ensure_correct_user
    @blog = Blog.find_by(id:params[:id])
    if @blog.user_id != current_user.id
      flash[:notice] = "編集の権限がありません"
      redirect_to("/")
    end
  end

  def show
    @user = User.find_by(id: @blog.user_id)
    @blog = Blog.includes(:user).find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new
  end

  def edit
    ensure_correct_user
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ensure_correct_user
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :content2, :user_id, :image)
    end
end
