module Fickle
  class FeaturesController < ActionController::Base
    
    unloadable
    
    layout 'fickle'
    
    def index
      @features = FeatureSet.for('global').features
      @models = Fickle::MODELS
      render 'fickle/features/index'
    end
    
    def create
      
    end
    
    def edit
      
    end
    
    def show
      
    end
  end
end