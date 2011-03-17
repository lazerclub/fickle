require 'spec_helper'

describe Fickle do
  it { should respond_to :setup! }
  
  context 'in a rails app' do
    before :all do
      ApplicationHelper = Class.new
      Fickle.setup!
    end
    
    it 'should include the view helpers in ApplicationHelper' do
      ApplicationHelper.new.should respond_to :feature_enabled?
    end
    
    it 'should extend class to include the has_featureset method' do
      class TestClass; end
      TestClass.should respond_to :has_featureset
    end
  end
end