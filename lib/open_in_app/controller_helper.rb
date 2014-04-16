require 'active_support/concern'

module OpenInApp

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
          params[:_oia].blank?
      end

      def open_in_app_url_present?
        (@open_in_app_url = open_in_app_url).present?
      end

      def open_in_app?
        open_in_app_device? &&
          open_in_app_supported_request? &&
          open_in_app_url_present? &&
          (
            self.class.open_in_app_options[:if].nil? ||
            send(self.class.open_in_app_options[:if])
          ) &&
          (
            self.class.open_in_app_options[:unless].nil? ||
            !send(self.class.open_in_app_options[:unless])
          )
      end

      def open_in_app_url
        nil
      end

      def open_in_app
        if open_in_app?
          render(template: 'open_in_app', layout: false) and return false
        end
        true
      end

    module ClassMethods
      def open_in_app(options={})
        open_in_app_options.merge!(options.reject { |key,| not [:if, :unless].include?(key.to_sym) })
        filter_options = options.reject { |key,| [:if, :unless, :prepend].include?(key.to_sym) }
        if prepend_filter = options.delete(:prepend)
          prepend_before_filter prepend_filter, :open_in_app, filter_options
        else
          before_filter :open_in_app, filter_options
        end
      end

      def open_in_app_options
        @open_in_app_options ||= {}
      end
    end
  end
end
