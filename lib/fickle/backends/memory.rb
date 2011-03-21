module Fickle
  module Backends
    class Memory < Fickle::AbstractBackend
      
      autoload :FeatureSet, 'fickle/backends/memory/feature_set'
      
      def initialize(options={})
        @models = []
        @model_feature_sets = {}
        @sets = {}
        super(options.merge(:feature_set_class => Fickle::Backends::Memory::FeatureSet))
      end
      
      def get_feature_set(feature_set_key)
        @sets[feature_set_key] ||= new_feature_set(feature_set_key)
      end
      
      def add_model_feature_set(feature_set_key, model)
        @model_feature_sets[model] ||= []
        @model_feature_sets[model] = (@model_feature_sets[model] | [feature_set_key])
      end
      
      def add_model(model)
        @models = (@models | [model])
      end
      
      def remove_model(model)
        @models = (@models - [model])
      end
      
      attr_reader :models, :model_feature_sets
      
      def add_feature_set(feature_set_key, feature_set)
        @sets[feature_set_key] = feature_set
      end
      
      def feature_sets
        @sets
      end
    end
  end
end