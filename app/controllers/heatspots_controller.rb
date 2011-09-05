require 'soap/wsdlDriver'

class HeatspotsController < ApplicationController
  protect_from_forgery :except => :heat_map_proxy
  
  # GET /heatspots
  # GET /heatspots.xml
  def index
    @heatspots = Heatspot.all
    @heatmap_proxy_url = "http://#{request.host}:#{request.port}/heat_map_proxy"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heatspots }
      format.json { render :json => @heatspots }
    end
  end

  # GET /heatspots/1
  # GET /heatspots/1.xml
  def show
    @heatspot = Heatspot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heatspot }
      format.json { render :json => @heatspot }
    end
  end

  # GET /heatspots/new
  # GET /heatspots/new.xml
  def new
    @heatspot = Heatspot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heatspot }
      format.json { render :json => @heatspot }
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
        format.json { render :json => @heatspot, :status => :created, :location => @heatspot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heatspot.errors, :status => :unprocessable_entity }
        format.json { render :json => @heatspot.errors, :status => :unprocessable_entity }
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
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heatspot.errors, :status => :unprocessable_entity }
        format.json { render :json => @heatspot.errors, :status => :unprocessable_entity }
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
      format.json { head :ok }
    end
  end
   
  def heat_map_proxy
   wsdl = 'http://www.heatmapapi.com/HeatmapGenerate2WS.asmx?wsdl'
   driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver
   response = driver.GetImagePathDecay(:k=>params['k'],:u=>params['u'],:lat1=>params['lat1'],:lat2=>params['lat2'],:lon1=>params['lon1'],:lon2=>params['lon2'],:w=>params['w'],:h=>params['h'],:d=>params['d'],:b=>params['b'],:x=>params['x']);
   render :text=>response["GetImagePathDecayResult"]
  end
end
