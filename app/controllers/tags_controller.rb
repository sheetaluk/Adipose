class TagsController < ApplicationController  
  def create
    @adipocyte = Adipocyte.find(params[:adipocyte_id])
    @tag = 
      @adipocyte.tags.create(
        :tag => params[:tag])
    render :json => 
      {:success => true, :tagId => @tag.id}
  end 


  def delete
    @tag = Tag.find(params[:id])
    @tag.destroy
    render :json => {:success => true}
  end
end
