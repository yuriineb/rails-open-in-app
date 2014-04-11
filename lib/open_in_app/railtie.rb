require 'rails'
require 'rack/mobile-detect'
require 'open_in_app/controller_helper'

module OpenInApp
  class Railtie < Rails::Railtie
    initializer "open_in_app_railtie.configure_rails_initialization" do |app|
      app.middleware.use Rack::MobileDetect
    end

    config.to_prepare do
      ApplicationController.send(:include, OpenInApp::ControllerHelper)
    end
  end
end
