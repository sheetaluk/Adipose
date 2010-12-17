class SearchController < ApplicationController
  def index
    @adipocytes = Adipocyte.all(:order=>"created_at DESC", :limit=>"40")
    @flaggedAdipocytes = 
      Adipocyte.all(
        :conditions =>	{ :flagged => 1}) 
    @popularAdipocytes =
      Adipocyte.find(:all, :order=>"noVotes DESC", :limit=>"20")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adipocytes, :xml => @flaggedAdipocytes, :xml => @popularAdipocytes}
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
