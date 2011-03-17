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
    it 'should create features that have not been tested before'
    it 'should return false when a feature is not enabled'
    it 'should return true when a feature is enabled'
  end

end