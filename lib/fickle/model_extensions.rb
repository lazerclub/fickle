module Fickle 
  module ModelExtensions
    def has_feature?(feature)
      feature_set.enabled?(feature)
    end
    
    def add_feature(feature)
      feature_set.enable_feature(feature)
    end
    
    def remove_feature(feature)
      feature_set.disable_feature(feature)
    end
    
    def feature_set
      @feature_set = Fickle::Config.backend.feature_set(fickle_id, self.class.name)
    end
    
    def fickle_id
      return @fickle_id if @fickle_id
      @fickle_id = case self
      when (defined? ActiveRecord and ActiveRecord::Base) then id
      when (defined? Mongoid and Mongoid::Document) then id
      else hash
      end
    end
  end
end