module Fickle
  class Railtie < Rails::Railtie
    
    generators do
      
    end
    
    config.to_prepare do
      Rails.logger.debug("Loading up Fickle")
      Fickle.setup!
    end
  end
end