class CommentsController < ApplicationController
  def create
    @adipocyte = Adipocyte.find(params[:adipocyte_id])
    @comment = 
      @adipocyte.comments.create(
        :commenter => params[:commenter],
        :content => params[:content])
    render :json => {:success => true, :commentId => @comment.id, :commenter => @comment.commenter}
  end
end
