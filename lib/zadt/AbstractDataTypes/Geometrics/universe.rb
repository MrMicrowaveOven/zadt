require_relative 'point.rb'
require_relative 'sphere.rb'

module Zadt
  class Universe
    attr_reader :points, :objects
    def initialize(num_dim = nil)
      @num_dim = num_dim
      @points = []
      @objects = []
    end

    def self.help
      Universe.show_help_message
    end

    def help
      Universe.help
    end

    def self.distance(pointa, pointb)
      raise "different dimensions" if pointa.dims != pointb.dims
      coordinate_distances = Array.new
      pointa.dims.times {|coord| coordinate_distances[coord] = pointa.coords[coord] - pointb.coords[coord]}
      sum_of_squares = coordinate_distances.inject(0) {|sum, coord| sum += coord ** 2}
      return Math.sqrt(sum_of_squares)
    end

    def add_point(coords)
      point = Point.new(coords)
      dim_check(point)
      @points << point
      point
    end

    def add_sphere(radius, center)
      sphere = Sphere.new(radius, center)
      dim_check(sphere.center)
      @objects << sphere
      sphere
    end

    private

    def dim_check(point)
      return if !@num_dim
      raise "Wrong number of dimensions" if point.dims != @num_dim
    end

    def self.show_help_message
      Zadt::ADT::show_universe_help_message
    end
  end
end
