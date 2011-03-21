module Fickle
  class ApplicationController < ActionController::Base
    layout 'fickle'
    before_filter :get_models, :get_features, :get_backend, :get_overrides
    
    def get_models
      @models = Fickle::Config.backend.models
    end
    
    def get_features
      @features = Fickle::Config.backend.feature_set('global')
    end
    
    def get_backend
      @backend = Fickle::Config.backend
    end
    
    def get_overrides
      @overrides = Fickle::Config.backend.feature_set('master')
    end
  end
end