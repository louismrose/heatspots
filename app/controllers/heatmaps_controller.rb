class HeatmapsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /heatmaps
  # GET /heatmaps.xml
  def index
    @heatmaps = Heatmap.all
    respond_with(@heatmaps)
  end

  # GET /heatmaps/1
  # GET /heatmaps/1.xml
  def show
    @heatmap = Heatmap.find(params[:id])
    @heatmap_proxy_url = "http://#{request.host}:#{request.port}/heat_map_proxy"

    respond_with(@heatmap, :include => :heatspots)
  end

  # GET /heatmaps/new
  # GET /heatmaps/new.xml
  def new
    @heatmap = Heatmap.new
    respond_with(@heatmap)
  end

  # GET /heatmaps/1/edit
  def edit
    @heatmap = Heatmap.find(params[:id])
    respond_with(@heatmap)
  end

  # POST /heatmaps
  # POST /heatmaps.xml
  def create
    @heatmap = Heatmap.new(params[:heatmap])
    flash[:notice] = 'Heatmap was successfully created.' if @heatmap.save
    
    respond_with(@heatmap)
  end

  # PUT /heatmaps/1
  # PUT /heatmaps/1.xml
  def update
    @heatmap = Heatmap.find(params[:id])

    flash[:notice] = 'Heatmap was successfully updated.' if @heatmap.update_attributes(params[:heatmap])
    
    respond_with(@heatmap)
  end

  # DELETE /heatmaps/1
  # DELETE /heatmaps/1.xml
  def destroy
    @heatmap = Heatmap.find(params[:id])
    @heatmap.destroy

    respond_with(@heatmap)
  end
end
