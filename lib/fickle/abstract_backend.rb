module Fickle
  class AbstractBackend
    
    def initialize(options)
      @_klass = options[:feature_set_class]
      add_feature_set('global', new_feature_set('global', :set_default => true))
      add_feature_set('master', new_feature_set('master'))
    end
    
    def new_feature_set(feature_set_key, options={})
      options.merge!(:key => feature_set_key)
      if !['master', 'global'].include?(feature_set_key)
        options[:override] = feature_set('master')
        options[:fallthrough] = feature_set('global')
      end
      @_klass.new(options)
    end
    
    def global_enable(feature)
      feature_set('global').enable_feature(feature)
    end
    
    def global_disable(feature)
      feature_set('global').disable_feature(feature)
    end
    
    def remove_global(feature)
      feature_set('global').remove_feature(feature)
    end
    
    def override_enable(feature)
      feature_set('master').enable_feature(feature)
    end
    
    def override_disable(feature)
      feature_set('master').disable_feature(feature)
    end
    
    def remove_override(feature)
      feature_set('master').remove_feature(feature)
    end
    
    def feature_set(key, model=nil)
      if model
        feature_set = get_feature_set("#{model}-#{key}")
        add_model_feature_set("#{model}-#{key}", model)
      else
        feature_set = get_feature_set(key)
      end
      return feature_set
    end
    
    def inspect
      "#<Fickle::Backend overrides:#{feature_set('master').inspect} fallthroughs:#{feature_set('global').inspect}>"
    end
    
    alias_method :to_s, :inspect
  end
end