class AdipocytesController < ApplicationController
  # GET /adipocytes
  # GET /adipocytes.xml
  def index
  end

  # GET /adipocytes/1
  # GET /adipocytes/1.xml
  def show
    @adipocyte = Adipocyte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adipocyte }
    end
  end

  # GET /adipocytes/new
  # GET /adipocytes/new.xml
  def new
    @adipocyte = Adipocyte.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adipocyte }
    end
  end

  # GET /adipocytes/1/edit
  def edit
    @adipocyte = Adipocyte.find(params[:id])
  end

  # POST /adipocytes
  # POST /adipocytes.xml
  def create
    @adipocyte = Adipocyte.new(params[:adipocyte])
    @adipocyte.update_attributes(:noVotes => 1, :enabled => true)

    respond_to do |format|
      if @adipocyte.save
        format.html { redirect_to(@adipocyte, :notice => 'Adipocyte was successfully created.') }
        format.xml  { render :xml => @adipocyte, :status => :created, :location => @adipocyte }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adipocyte.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adipocytes/1
  # PUT /adipocytes/1.xml
  def update
    @adipocyte = Adipocyte.find(params[:id])

    respond_to do |format|
      if @adipocyte.update_attributes(params[:adipocyte])
        format.html { redirect_to(@adipocyte, :notice => 'Adipocyte was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adipocyte.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /adipocytes/castVote
  def castVote
    @adipocyte = Adipocyte.find(params[:id])
    numVotes = @adipocyte.noVotes + 1
    @adipocyte.update_attributes(:noVotes => numVotes)
    render :json => {:success => true, :numberOfVotes => numVotes}
  end
  
  # PUT /adipocytes/enable
  def enable
    @adipocyte = Adipocyte.find(params[:id])
    if(params[:enabled] == "1")
      @adipocyte.update_attributes(:enabled => false)
    else
      @adipocyte.update_attributes(:enabled => true)
    end
    render :json => {:success => true}
  end

  def flagAdipocyte
    @adipocyte = Adipocyte.find(params[:id])
    if(params[:flagged] == "1")
      @adipocyte.update_attributes(:flagged => false)
    else
      @adipocyte.update_attributes(:flagged => true)
    end
    render :json => {:success => true}
  end


  # DELETE /adipocytes/1
  # DELETE /adipocytes/1.xml
  def destroy
    @adipocyte = Adipocyte.find(params[:id])
    @adipocyte.destroy

    respond_to do |format|
      format.html { redirect_to(adipocytes_url) }
      format.xml  { head :ok }
    end
  end
end
