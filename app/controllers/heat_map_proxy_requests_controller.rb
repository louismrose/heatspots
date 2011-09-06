require 'soap/wsdlDriver'

class HeatMapProxyRequestsController < ApplicationController
  protect_from_forgery :except => :heat_map_proxy
  
  def new
    wsdl = 'http://www.heatmapapi.com/HeatmapGenerate2WS.asmx?wsdl'
     driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver
     response = driver.GetImagePathDecay(:k=>params['k'],:u=>params['u'],:lat1=>params['lat1'],:lat2=>params['lat2'],:lon1=>params['lon1'],:lon2=>params['lon2'],:w=>params['w'],:h=>params['h'],:d=>params['d'],:b=>params['b'],:x=>params['x']);
     render :text=>response["GetImagePathDecayResult"]
  end
end
