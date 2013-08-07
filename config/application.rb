require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"

Bundler.require(:default, Rails.env)

module MongoidBlank
  class Application < Rails::Application
  end
end
