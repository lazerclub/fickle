module Fickle
  class ModelFeaturesController < ApplicationController    
    before_filter :find_model
    
    def index
      @features = @backend.model_feature_sets[@model]
    end
    
    def show; end
    
    def update
      @feature_set = @backend.feature_set(params[:id], @model)
      
      if params[:enabled] == 'true'
        @feature_set.enable_feature(params[:feature])
      elsif params[:enabled] == 'false'
        @feature_set.enable_feature(params[:feature])
      end
      
      respond_to do |format|
        format.js { render :js => 'true'}
      end
    end
    
    
    private
    def find_model
      @model = (Fickle::Config.backend.models & [params[:model]]).first
      unless @model
        render :text => 'Not Found', :status => 404
      end
    end
  end
end