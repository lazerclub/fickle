module Fickle
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    class_option :route, :type => :boolean, :default => true, :desc => "Add route for the Fickle web interface"
    class_option :default_enabled, :type => :boolean, :default => false, :desc => "Default all features to be enabled"
    
    def generate_route
      route("fickle_admin 'features'") if options.route
    end
    
    def generate_config_file
      template "fickle.rb.erb", "config/initializers/fickle.rb"
    end
    
    def generate_public_files
      copy_file 'fickle.css', 'public/stylesheets/fickle/fickle.css'
      copy_file 'fickle.js', 'public/javascripts/fickle.js'
    end
      
  end
end
