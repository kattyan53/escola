  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @favorite = @user.favorites
      @nice = current_user.favorites.find_by(user_id: @user.id)
    end

    def edit
      @user = User.find(params[:id])
    end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_show_path(@user)
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

    private

    def user_params
      params.require(:user).permit(:name, :email, :profile, :image)
    end
  end
