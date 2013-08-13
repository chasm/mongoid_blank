class SiteController < ApplicationController
  respond_to :json
  
  def uuids
    num = (params[:num] || "1").to_i
    
    render :json => { uuids: get_uuids(num) }
  end
end
