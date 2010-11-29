class SearchController < ApplicationController
  def index
    @adipocytes = Adipocyte.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adipocytes }
    end
  end

  def wtf
    @adipocytes = 
      Adipocyte.all( 
        :conditions => ["userId = ? AND subject LIKE ?", 
          params[:user], 
          "%#{params[:subject]}%"])
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adipocytes }
    end
  end
end
