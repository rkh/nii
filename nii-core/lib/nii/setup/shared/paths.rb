# frozen_string_literal: true

module Nii::Setup::Shared
  module Paths
    # @api setup
    #
    # If enabled, Nii::Middleware will parse the locale from the given path.
    # If {#available_locales} are defined, it will only accept these values as valid path segments.
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     # Requests to "/en/home" will be translated to "/home" with locale set to "en"
    #     # Requests to "/" will redirect to "/en/" or "/de/" based on the user's language setting.
    #     available_locales "de", "en"
    #     locale_path
    #
    #     # disable locale path for beispiel.de and set locale to "de"
    #     domain "beispiel.de" do
    #       locale_path false
    #       locale "de"
    #     end
    #   end
    #
    # @default false
    def locale_path(value = true) = set(:locale_path, value)
    
    # @api setup
    #
    # Tells Nii to not handle requests to a given path.
    #
    # Requests for these paths are exempt form features like locale_path, and also will not trigger locale negotiation.
    # Calling this method multiple times will add paths to the list, rather than override previous values.
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     ignore_paths "/application.css", "/application.js"
    #   end
    def ignore_paths(*values) = add(:ignore_paths, values)
    alias_method :ignore_path, :ignore_paths
  end
end
