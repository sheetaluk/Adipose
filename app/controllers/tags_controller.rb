class TagsController < ApplicationController  
  def delete
    @tag = Tag.find(params[:id])
    @tag.destroy
    render :json => {:success => true}
  end
end
