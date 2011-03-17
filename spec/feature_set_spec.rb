require 'spec_helper'

describe Fickle::FeatureSet do
  it 'should allow the enabling of features' do
    subject.enable_feature(:kill)
    subject.enabled?(:kill).should be true
  end
  
  it 'should allow the disabling of features' do
    subject.disable_feature(:kill)
    subject.enabled?(:kill).should be false
  end
  
  it 'should default to false' do
    subject.enabled?(:jabberwocky).should be false
  end
  
  context 'persistence' do
    before :each do
      @feature_set_one = Fickle::FeatureSet.for('kings')
      @feature_set_two = Fickle::FeatureSet.for('kings')
    end
    
    it 'should work' do
      @feature_set_one.enable_feature(:drawing)
      @feature_set_two.enabled?(:drawing).should be true
    end
  end
    
end