module Fickle
  module Config
    
    # Please ignore the mess. Memoizing on a ModuleAccessor without ActiveSupport
    def self.default_state
      @default_state ||= false
      def self.default_state
        @default_state
      end
      @default_state
    end
    
    def self.backend=(backend)
      @backend = backend
    end
    
    def self.backend
      @backend ||= Fickle::Backends::Memory.new
      def self.backend
        @backend
      end
      @backend
    end
    
    def self.default_state=(default_state)
      @default_state = default_state
    end
  end
end