class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    resource = params[:resource_id]
    @comment = current_user.comments.build(comment_params)
    @comment.resource_id = resource

    if @comment.save
      redirect_to resource_path(resource)
    end    
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
