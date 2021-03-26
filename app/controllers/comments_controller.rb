class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cook_path(@comment.cook)
    else
      @cook = @comment.cook
      @comments = @cook.comments
      render :"cooks/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cook_id: params[:cook_id])
  end
end
