require 'active_support/concern'

module OpenInApp

  class Filter
    def self.filter(controller)
      if controller.send(:open_in_app?)
        controller.send(:open_in_app) and return false
      end
    end
  end

  module ControllerHelper
    extend ActiveSupport::Concern

    protected
      def open_in_app_device?
        mobile_device = request.env[Rack::MobileDetect::X_HEADER]
        !!(mobile_device && %w(iphone ipod).include?(mobile_device.downcase))
      end

      def open_in_app_supported_request?
        request.get? &&
          !request.xhr? &&
          request.format.html? &&
          params[:opened_in_app].blank?
      end

      def open_in_app_url_present?
        (@open_in_app_url = open_in_app_url).present?
      end

      def open_in_app?
        open_in_app_device? &&
          open_in_app_supported_request? &&
          open_in_app_url_present?
      end

      def open_in_app_url
        nil
      end

      def open_in_app
        render(template: 'open_in_app', layout: false)
      end

    module ClassMethods
      def open_in_app(options={})
        before_filter OpenInApp::Filter, options
      end
    end
  end
end
