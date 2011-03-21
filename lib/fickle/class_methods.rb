module Fickle
  module ClassMethods
    
    def has_feature_set
      Fickle::Config.backend.add_model(name)
      include Fickle::ModelExtensions
    end
    
    alias_method :is_subjugated, :has_feature_set
    
  end
end
    
    