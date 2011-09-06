class HeatspotsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :find_heatmap
  
  # GET /heatspots/new
  # GET /heatspots/new.xml
  def new
    @heatspot = Heatspot.new
    @heatspot.heatmap = @heatmap
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
    
    redirect_to @heatmap
  end

  # PUT /heatspots/1
  # PUT /heatspots/1.xml
  def update
    @heatspot = Heatspot.find(params[:id])
    flash[:notice] = 'Heatspot was successfully updated.' if @heatspot.update_attributes(params[:heatspot])
    
    redirect_to @heatmap
  end

  # DELETE /heatspots/1
  # DELETE /heatspots/1.xml
  def destroy
    @heatspot = Heatspot.find(params[:id])
    @heatspot.destroy
    
    redirect_to @heatmap
  end

private
  def find_heatmap
    @heatmap = Heatmap.find(params[:heatmap_id])
  end
end
