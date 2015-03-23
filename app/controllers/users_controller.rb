class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save!
    session[:user_id] = user.id
    redirect_to flights_path
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
