module Fickle
  
  MODELS = []
  
  def self.setup!
    Class.send :include, Fickle::ClassMethods unless Class.respond_to? :has_featureset
    begin
      ApplicationHelper
    rescue Exception; nil
    else
      ApplicationHelper.send :include, Fickle::ViewHelpers
    end
    begin
      ActionDispatch::Routing::Mapper
    rescue Exception; nil
    else
      ActionDispatch::Routing::Mapper.send :include, Fickle::Routes
    end
  end
  
  autoload :FeatureSet, 'fickle/feature_set'
  autoload :ClassMethods, 'fickle/class_methods'
  autoload :Railtie, 'fickle/railtie'
  autoload :VERSION, 'fickle/version'
  autoload :ViewHelpers, 'fickle/view_helpers'
  autoload :ModelExtensions, 'fickle/model_extensions'
  autoload :Routes, 'fickle/routes'
  
  require 'fickle/railtie' if defined? Rails
  
end
