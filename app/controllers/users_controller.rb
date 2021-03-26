class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @cooks = Cook.find(@user.cook_ids)
  end
  
end
