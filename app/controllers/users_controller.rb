class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

end
