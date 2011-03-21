module Fickle
  module ViewHelpers
    def feature_enabled?(feature)
      Fickle::Config.backend.feature_set('views').enabled?(feature)
    end
  end
end