require 'spec_helper'
Fickle.setup!

class Genius
  has_featureset
end

describe Genius do
  it { should respond_to :has_feature? }
  
  it 'should allow features to be enabled' do
    subject.add_feature :thrill
    subject.has_feature?(:thrill).should be true
  end
  
  it 'should allow features to be disabled' do
    subject.remove_feature :chill
    subject.has_feature?(:chill).should be false
  end
  
  it 'should default to false for new features' do
    subject.has_feature?(:evil).should be false
  end
end