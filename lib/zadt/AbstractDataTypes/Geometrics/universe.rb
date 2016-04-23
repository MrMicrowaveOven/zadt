require_relative 'point.rb'

module Zadt
  class Universe
    attr_reader :points
    def initialize(num_dim = nil)
      @num_dim = num_dim
      @points = []
    end

    def distance(pointa, pointb)
      dim_check(pointa)
      dim_check(pointb)
      raise "different universes" if pointa.dims != pointb.dims
      coordinate_distances = Array.new
      pointa.dims.times {|coord| coordinate_distances[coord] = pointa.coords[coord] - pointb.coords[coord]}
      sum_of_squares = coordinate_distances.inject(0) {|sum, coord| sum += coord ** 2}
      return Math.sqrt(sum_of_squares)
    end

    def add_point(coords)
      point = Point.new(coords)
      @points << point
      point
    end

    def dim_check(point)
      return if !@num_dim
      raise "Wrong number of dimensions" if point.dims != @num_dim
    end
  end
end
