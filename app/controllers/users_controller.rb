  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @favorite = @user.favorites
    end

    def edit
      @user = User.find(params[:id])
    end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render :edit
    end
   end

   def following
     @user  = User.find(params[:id])
     @users = @user.followings
     render 'show_follow'
   end

   def followers
     @user  = User.find(params[:id])
     @users = @user.followers
     render 'show_follower'
   end

   def regist_profile
     @user = User.find(params[:id])
   end

   def posts
     @user = User.find(params[:id])
     @blogs = @user.blogs.page(params[:page])
   end

   def favorites
     @user = User.find(params[:id])
     @favorites = @user.favorites
   end

    private

    def user_params
      params.require(:user).permit(:name, :email, :profile, :image, :introduce,
      :career, :yser_of_experience, :language)
    end
  end
