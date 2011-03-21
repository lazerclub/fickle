module Fickle
  module Routes
    def fickle_admin(path, options = {})
      options = {:controller => 'Fickle::Features', :model_controller => 'Fickle::ModelFeatures'}.merge(options)      
      
      namespace 'fickle', :module => nil, :path => path do
        resources :model_features, :path => 'models/:model', :controller => options.delete(:model_controller)
        resources :features, options.merge(:path => '')
      end
    end
  end
end