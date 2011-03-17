module Fickle
  class Railtie < Rails::Railtie
    
    generators do
      
    end
    
    config.to_prepare do
      Fickle.setup!
    end
  end
end