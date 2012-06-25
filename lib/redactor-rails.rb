require "redactor-rails/version"

module RedactorRails
    require 'redactor-rails/engine'
    require 'redactor-rails/helper'
    require 'redactor-rails/configuration'
    def self.configuration
      @configuration ||= Configuration.load(::Rails.root.join("config/redactor.yml"))
    end

end
