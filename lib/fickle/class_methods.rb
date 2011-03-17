module Fickle
  module ClassMethods
    
    def has_featureset
      Fickle::MODELS.push(self)
      
    end
    
  end
end
    
    