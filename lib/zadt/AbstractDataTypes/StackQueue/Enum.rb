module Zadt
  class Enum
    attr_accessor :values
    def initialize(defaults = [])
      @values = defaults
    end
    def [](element)
      @values.index(element)
    end
  end
end
