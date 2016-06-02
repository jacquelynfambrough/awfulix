class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :movies, through: :reviews
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
