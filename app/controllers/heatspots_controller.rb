class HeatspotsController < ApplicationController
  # GET /heatspots
  # GET /heatspots.xml
  def index
    @heatspots = Heatspot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heatspots }
    end
  end

  # GET /heatspots/1
  # GET /heatspots/1.xml
  def show
    @heatspot = Heatspot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heatspot }
    end
  end

  # GET /heatspots/new
  # GET /heatspots/new.xml
  def new
    @heatspot = Heatspot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heatspot }
    end
  end

  # GET /heatspots/1/edit
  def edit
    @heatspot = Heatspot.find(params[:id])
  end

  # POST /heatspots
  # POST /heatspots.xml
  def create
    @heatspot = Heatspot.new(params[:heatspot])

    respond_to do |format|
      if @heatspot.save
        format.html { redirect_to(@heatspot, :notice => 'Heatspot was successfully created.') }
        format.xml  { render :xml => @heatspot, :status => :created, :location => @heatspot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heatspot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heatspots/1
  # PUT /heatspots/1.xml
  def update
    @heatspot = Heatspot.find(params[:id])

    respond_to do |format|
      if @heatspot.update_attributes(params[:heatspot])
        format.html { redirect_to(@heatspot, :notice => 'Heatspot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heatspot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heatspots/1
  # DELETE /heatspots/1.xml
  def destroy
    @heatspot = Heatspot.find(params[:id])
    @heatspot.destroy

    respond_to do |format|
      format.html { redirect_to(heatspots_url) }
      format.xml  { head :ok }
    end
  end
end
