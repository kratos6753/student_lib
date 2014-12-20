class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update]
  def show
    #This will give instance variables. Page will display user details and also all his posts.
  end

  def update
    if @user.update_attributes!(user_params)
      respond_to do |format|
        format.html { redirect_to @user, flash[:success] = "User Profile updated successfully" }
        format.json { render :json => @user }
      end
    else
      respond_to do |format|
        format.html { render @user , flash[:warning] = "User Profile updated successfully" }
        format.json { render :nothing => true }
      end
    end
  end

  def edit
  end

  def articles
    @user = current_user
    @posts = Post.where("user_id = ?", current_user.id)
  end
  private
    def set_user
      @user = current_user
      #@user.avatar.url ||= "user-default-blue.png"
    end

    def user_params 
      params.require(:user).permit(:nick,:room,:hostel,:email,:contact)
    end

end
