class SearchController < ApplicationController
  def index
    @adipocytes = Adipocyte.all
    @flaggedAdipocytes = 
      Adipocyte.all(
        :conditions =>	{ :flagged => 1}) 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adipocytes, :xml => @flaggedAdipocytes}
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
