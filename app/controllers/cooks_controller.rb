class CooksController < ApplicationController

  def index
    @cook = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.create(cook_params)
    if @cook.save
       redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @cook = Cook.find(params[:id])
    unless @cook.user_id == current_user.id
       redirect_to cooks_path
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
        redirect_to cook_path
    else
       render :edit
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to cooks_path
  end

  def show
    @cook = Cook.find(params[:id])
    @comments = @pcook.comments.includes(:user)
    @comment = Comment.new
  end
  

  private
  def cook_params
    params.require(:cook).permit(:title, :catch_copy, :category_id, :cooktime_id, :material, :making, :point, :image).merge(user_id: current_user.id)
  end

end