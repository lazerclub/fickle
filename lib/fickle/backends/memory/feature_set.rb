module Fickle
  module Backends
    class Memory
      class FeatureSet < Fickle::AbstractFeatureSet
        
        def initialize(options={})
          super
          @features = {}
        end
        
        def feature_enabled?(feature)
          features[feature.to_s]
        end
        
        def enable_feature(feature)
          features[feature.to_s] = true
        end
        
        def disable_feature(feature)
          features[feature.to_s] = false
        end
        
        def remove_feature(feature)
          features.delete(feature.to_s)
        end
        
        def each
          features.each do |feature, enabled|
            yield feature, enabled
          end
        end
        
        private
        attr_reader :features
        
      end
    end
  end
end