class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @therapies = @user.therapies
  end
end
