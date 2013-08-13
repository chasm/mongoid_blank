class ApplicationController < ActionController::Base
  helper_method :get_uuids
  
  def get_uuids(count)
    (0...count).to_a.map do
      SecureRandom.uuid
    end
  end
end
