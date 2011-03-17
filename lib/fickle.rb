module Fickle
  
  MODELS = []
  
  def self.setup!
    Class.send :include, Fickle::ClassMethods unless Class.respond_to? :has_featureset
    ApplicationHelper.send :include, Fickle::ViewHelpers if defined? ApplicationHelper
  end
  
  autoload :FeatureSet, 'fickle/feature_set'
  autoload :ClassMethods, 'fickle/class_methods'
  autoload :Railtie, 'fickle/railtie'
  autoload :VERSION, 'fickle/version'
  autoload :ViewHelpers, 'fickle/view_helpers'
  
  require 'fickle/railtie' if defined? Rails
  
end
