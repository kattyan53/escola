class OfficialAccountsController < ApplicationController
  before_action :set_official_account, only: [:show, :edit, :update, :destroy]

  def index
    @official_accounts = OfficialAccount.all
  end

  def show
    @user = User.find_by(id: @official_account.user_id)
    @official_account = OfficialAccount.find(params[:id])
  end

  def new
    @official_account = OfficialAccount.new
  end

  def edit
  end

  def create
    @official_account = OfficialAccount.new(official_account_params)
    @official_account.user_id = current_user.id

    respond_to do |format|
      if @official_account.save
        format.html { redirect_to @official_account, notice: 'Official account was successfully created.' }
        format.json { render :show, status: :created, location: @official_account }
      else
        format.html { render :new }
        format.json { render json: @official_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @official_account.update(official_account_params)
        format.html { redirect_to @official_account, notice: 'Official account was successfully updated.' }
        format.json { render :show, status: :ok, location: @official_account }
      else
        format.html { render :edit }
        format.json { render json: @official_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @official_account.destroy
    respond_to do |format|
      format.html { redirect_to official_accounts_url, notice: 'Official account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_official_account
      @official_account = OfficialAccount.find(params[:id])
    end

    def official_account_params
      params.require(:official_account).permit(:title, :content_top, :content_middle, :content_bottom, :user_id, :image_top, :image_left, :image_right, :image_bottom, :admin)
    end
end
