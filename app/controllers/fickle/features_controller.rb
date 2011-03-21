module Fickle
  class FeaturesController < ApplicationController
    
            
    def index
      
    end
    
    def update
      if params[:enabled] == 'true'
        @backend.global_enable(params[:id])
      elsif params[:enabled] == 'false'
        @backend.global_disable(params[:id])
      elsif params[:hard_stop] == 'true'
        @backend.override_disable(params[:id])
      elsif params[:hard_stop] == 'false'
        @backend.remove_override(params[:id])
      end
      
      respond_to do |format|
        format.js { render :js => 'true'}
      end
    end
    
    def create
      
    end
    
    def edit
      
    end
    
    def show
      
    end
  end
end