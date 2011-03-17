module Fickle
  module ViewHelpers
    def feature_enabled?(feature)
      FeatureSet.for('global').enabled?(feature)
    end
  end
end