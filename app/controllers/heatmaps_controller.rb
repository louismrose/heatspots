class HeatmapsController < ApplicationController
  # GET /heatmaps
  # GET /heatmaps.xml
  def index
    @heatmaps = Heatmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heatmaps }
    end
  end

  # GET /heatmaps/1
  # GET /heatmaps/1.xml
  def show
    @heatmap = Heatmap.find(params[:id])
    @heatmap_proxy_url = "http://#{request.host}:#{request.port}/heat_map_proxy"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heatmap }
    end
  end

  # GET /heatmaps/new
  # GET /heatmaps/new.xml
  def new
    @heatmap = Heatmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heatmap }
    end
  end

  # GET /heatmaps/1/edit
  def edit
    @heatmap = Heatmap.find(params[:id])
  end

  # POST /heatmaps
  # POST /heatmaps.xml
  def create
    @heatmap = Heatmap.new(params[:heatmap])

    respond_to do |format|
      if @heatmap.save
        format.html { redirect_to(@heatmap, :notice => 'Heatmap was successfully created.') }
        format.xml  { render :xml => @heatmap, :status => :created, :location => @heatmap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heatmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heatmaps/1
  # PUT /heatmaps/1.xml
  def update
    @heatmap = Heatmap.find(params[:id])

    respond_to do |format|
      if @heatmap.update_attributes(params[:heatmap])
        format.html { redirect_to(@heatmap, :notice => 'Heatmap was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heatmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heatmaps/1
  # DELETE /heatmaps/1.xml
  def destroy
    @heatmap = Heatmap.find(params[:id])
    @heatmap.destroy

    respond_to do |format|
      format.html { redirect_to(heatmaps_url) }
      format.xml  { head :ok }
    end
  end
end
