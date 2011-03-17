module Fickle
  module ClassMethods
    
    def has_featureset
      Fickle::MODELS.push(self)
      include Fickle::ModelExtensions
    end
    
  end
end
    
    