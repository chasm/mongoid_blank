class SiteController < ApplicationController
  respond_to :json
  
  # We need a route to get UUIDs. This action
  # takes a :num of UUIDs to create, and defaults to 1
  # if :num is not supplied. It returns them in a hash
  # with the key :uuids set to the array of UUIDs.
  def uuids
    num = (params[:num] || "1").to_i
    
    render :json => { uuids: get_uuids(num) }
  end
end
