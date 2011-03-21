module Fickle
  class AbstractFeatureSet
    
    include Enumerable
    
    def initialize(options = {}) 
      @_override = options[:override]
      @_fallthrough = options[:fallthrough]
      @_set_default = options[:set_default]
      @_name = options[:key]
    end
    
    def enabled?(feature)
      return overridden(feature) if overridden?(feature)
      return feature_enabled?(feature) if feature_defined?(feature)
      return fallthrough(feature)
    end
    
    def inspect
      "#<Fickle::FeatureSet #@_name#{map{|key, value| " #{key}:#{value}"}.join}>"
    end
    
    alias_method :to_s, :inspect
    
    private
    
    def overridden?(feature)
      return false unless @_override
      if !@_override.feature_enabled?(feature).nil?
        return true
      end
      return false
    end
    
    def overridden(feature)
      @_override.feature_enabled?(feature)
    end
    
    def feature_defined?(feature)
      !feature_enabled?(feature).nil?
    end
    
    def fallthrough(feature)  
      return @_fallthrough.enabled?(feature) if @_fallthrough
      if @_set_default
        Fickle::Config.default_state ? enable_feature(feature) : disable_feature(feature)
        return feature_enabled?(feature)
      end
    end
    
  end
end