class CommentsController < ApplicationController
  def create
    @adipocyte = Adipocyte.find(params[:adipocyte_id])
    @comment = 
      @adipocyte.comments.create(
        :commenter => params[:commenter],
        :content => params[:content])
    render :json => 
      {:success => true, :commentId => @comment.id, :commenter => @comment.commenter}
  end
  
  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :json => {:success => true}
  end
end
