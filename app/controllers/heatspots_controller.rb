class HeatspotsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /heatspots
  # GET /heatspots.xml
  def index
    @heatspots = Heatspot.all
    @heatmap_proxy_url = "http://#{request.host}:#{request.port}/heat_map_proxy"

    respond_with(@heatspots)
  end

  # GET /heatspots/1
  # GET /heatspots/1.xml
  def show
    @heatspot = Heatspot.find(params[:id])
    respond_with(@heatspot)
  end

  # GET /heatspots/new
  # GET /heatspots/new.xml
  def new
    @heatspot = Heatspot.new
    respond_with(@heatspot)
  end

  # GET /heatspots/1/edit
  def edit
    @heatspot = Heatspot.find(params[:id])
    respond_with(@heatspot)
  end

  # POST /heatspots
  # POST /heatspots.xml
  def create
    @heatspot = Heatspot.new(params[:heatspot])
    flash[:notice] = 'Heatspot was successfully created.' if @heatspot.save
    respond_with(@heatspot)
  end

  # PUT /heatspots/1
  # PUT /heatspots/1.xml
  def update
    @heatspot = Heatspot.find(params[:id])
    flash[:notice] = 'Heatspot was successfully updated.' if @heatspot.update_attributes(params[:heatspot])
    respond_with(@heatspot)
  end

  # DELETE /heatspots/1
  # DELETE /heatspots/1.xml
  def destroy
    @heatspot = Heatspot.find(params[:id])
    @heatspot.destroy
    respond_with(@heatspot)
  end
end
