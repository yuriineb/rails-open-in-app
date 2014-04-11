require 'rails'
require 'rack/mobile-detect'
require 'open_in_app/controller_helper'

module OpenInApp
  class Engine < ::Rails::Engine
    config.app_middleware.use Rack::MobileDetect

    config.to_prepare do
      ApplicationController.send(:include, OpenInApp::ControllerHelper)
    end
  end
end
