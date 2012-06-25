require 'rails/generators'
require 'rails/generators/migration'
module Redactor
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include ::Rails::Generators::Migration
      desc "Generates migration for Tag and Tagging models"

      class_option :orm, :type => :string, :default => "active_record",
	:desc => "Backend processor for upload support"

      class_option :backend, :type => :string, :default => 'paperclip',
	:desc => "paperclip (default), carrierwave"

      def self.source_root
	@source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def self.next_migration_number(dirname)
	Time.now.strftime("%Y%m%d%H%M%S")
      end

      def mount_engine
	route "mount RedactorRails::Engine => '/redactor-rails'"
      end

      def create_models
	[:asset, :picture, :attachment_file].each do |filename|
	  template "#{generator_dir}/redactor/#{filename}.rb",
	  File.join('app/models', redactor_dir, "#{filename}.rb")
	end

	if backend == "carrierwave"
	  template "#{uploaders_dir}/uploaders/redactor_attachment_file_uploader.rb",
	    File.join("app/uploaders", "redactor_attachment_file_uploader.rb")

	  template "#{uploaders_dir}/uploaders/redactor_picture_uploader.rb",
	    File.join("app/uploaders", "redactor_picture_uploader.rb")
	end
      end

      def create_migration
	if ["active_record"].include?(orm)
	  migration_template "#{generator_dir}/migration.rb", File.join('db/migrate', "create_redactor_assets.rb")
	end
      end

      protected

      def redactor_dir
	'redactor'
      end

      def generator_dir
	@generator_dir ||= [orm, backend].join('/')
      end

      def uploaders_dir
	@uploaders_dir ||= ['base', 'carrierwave'].join('/')
      end

      def orm
	options[:orm] || "active_record"
      end

      def backend
	options[:backend] || "paperclip"
      end

    end
  end
end
