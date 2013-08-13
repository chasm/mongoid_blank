class ApplicationController < ActionController::Base
  # Allow the get_uuids method to be access from the views
  # (just in case)
  helper_method :get_uuids
  
  # Provide a method to all controllers to allow them to get
  # one or more UUIDs in an array
  def get_uuids(count)
    (0...count).to_a.map do
      SecureRandom.uuid
    end
  end
end
