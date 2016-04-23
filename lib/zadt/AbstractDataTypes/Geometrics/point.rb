module Zadt
  class Point
    attr_reader :coords, :dims
    def initialize(coordinates)
      @coords = coordinates
      @dims = @coords.length
    end
  end
end
