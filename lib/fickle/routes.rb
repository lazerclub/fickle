module Fickle
  module Routes
    def fickle_admin(path, options = {})
      options = {:controller => 'Fickle::Features'}.merge(options)
      options[:url] = path
      resources :features, options
      Rails.logger.debug("OH SNAP YOU MAPPED FEATURES TO FICKLE")
    end
  end
end