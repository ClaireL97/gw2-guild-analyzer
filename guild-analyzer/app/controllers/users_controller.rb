class UsersController < ApplicationController

  def new
    @user= User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password_digest]
      if @user.save
        session_login @user
        redirect_to new_user_path
      else
        @user.errors.full_messages
        render :new
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :gw2_character_id, :password_digest, :encrypted_password)
  end

end
