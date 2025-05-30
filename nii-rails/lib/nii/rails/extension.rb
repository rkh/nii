# frozen_string_literal: true

module Nii::Rails
  module Extension
    module View
      include Nii::Helpers
      def nii(complain = true) = controller.nii
    end

    module Controller
      include Nii::Helpers

      def nii(complain = true)
        @nii ||= begin
          namespace = [request.nii.config.namespace, controller_name, action_name]
          request.nii.subcontext(namespace: namespace.compact.join('/'))
        end
      end
    end

    module Mailer
      include Nii::Helpers

      def nii(complain = true)
        @nii ||= begin
          config    = Rails.configuration.respond_to?(:nii) ? Rails.configuration.nii : Nii::Config.new
          namespace = _nii_namespace || config.namespace
          namespace = [namespace, mailer_name, action_name].compact.join('/')
          config    = config.merge(namespace: namespace) if namespace != ''
          locale   = config.locale
          locale ||= ::I18n.locale if defined? ::I18n
          Nii::Context.new(locale, config)
        end
      end
    end

    module Request
      def nii(complain = true)
        @nii ||= begin
          config = Rails.configuration.nii if Rails.configuration.respond_to? :nii
          Nii::RackEnv[self, config].context
        end
      end
    end

    module Console
      include Nii::Helpers

      def nii(complain = true)
        @nii ||= begin
          config   = Rails.configuration.respond_to?(:nii) ? Rails.configuration.nii : Nii::Config.new
          config   = config.merge(namespace: _nii_namespace) if config.namespace.nil? and _nii_namespace
          locale   = config.locale
          locale ||= ::I18n.locale if defined? ::I18n
          Nii::Context.new(locale, config)
        end
      end
    end

    def self.install
      ActionDispatch::Request.include Request
      ActionView::Base.include        View        if defined? ActionView::Base
      ActionController::Base.include  Controller  if defined? ActionController::Base
      ActionMailer::Base.include    Mailer        if defined? ActionMailer::Base
      Types.register                              if defined? ActiveModel::Type

      Rails::Railtie.console do
        if defined? Rails::ConsoleMethods
          Rails::ConsoleMethods.include Console
        else
          TOPLEVEL_BINDING.eval('self').extend Console
        end
      end
    end
  end
end
