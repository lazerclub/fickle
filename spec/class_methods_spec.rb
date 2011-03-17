require 'spec_helper'

describe Fickle::ClassMethods do
  
  describe '#has_featureset' do
    
    before :all do
      Fickle.setup!
      class MagicClass 
        has_featureset
      end
    end
    
    it 'should add the class to the models pile' do    
      Fickle::MODELS.should include MagicClass
    end
    
    it 'should mix in the feature-specific methods' do
      MagicClass.new.should respond_to :has_feature?
    end
  end
end