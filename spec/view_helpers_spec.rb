require 'spec_helper'

describe Fickle::ViewHelpers do
  
  class TestClass
    include Fickle::ViewHelpers
  end
  
  subject do
    TestClass.new
  end
  
  it { should respond_to :feature_enabled? }
  
  describe '#feature_enabled?' do
    
    before :each do
      @feature_set = Fickle::FeatureSet.for('global')
    end
    
    it 'should create features that have not been tested before and default to false' do
      subject.feature_enabled?(:feature).should be false
    end
    it 'should return false when a feature is not enabled' do
      @feature_set.disable_feature(:kill_robots)
      subject.feature_enabled?(:kill_robots).should be false
    end
    it 'should return true when a feature is enabled' do
      @feature_set.enable_feature(:kill_robots)
      subject.feature_enabled?(:kill_robots).should be true
    end
  end

end