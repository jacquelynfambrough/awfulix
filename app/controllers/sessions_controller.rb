class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password, :username)
    @user = user.confirm(user_params)
    if @user
      login(@user)
      redirect_to new_user_path
    end
  end
end
