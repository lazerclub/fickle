module Fickle
  class FeatureSet
    def self.for(context)
      @contexts ||= {}
      @contexts[context] ||= FeatureSet.new
    end
    
    def initialize
      @features = {}
    end
    
    def enable_feature(name)
      @features[name] = true
    end
    
    def disable_feature(name)
      @features[name] = false
    end
    
    def enabled?(name)
      @features[name] || disable_feature(name)
    end
    
    attr_reader :features
    
  end
end