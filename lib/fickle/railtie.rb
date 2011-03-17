module Fickle
  class Railtie < Rails::Engine
    
    config.to_prepare do
      Fickle.setup!
    end
  end
end