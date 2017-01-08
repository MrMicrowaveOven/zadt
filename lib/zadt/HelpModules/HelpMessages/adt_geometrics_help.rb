module Zadt
  class ADT
    def self.show_universe_help_message
      puts "Here are the methods for Universe:"
      puts "#add_point(coordinates)"
      puts "#add_sphere(radius, center)"
      puts "#self.distance(pointA, pointB)"
    end

    def self.show_point_help_message
      puts "Here are the methods for Point:"
      puts "#coords,"
      puts "#dims, the number of dimensions in the coordinates"
    end

    def self.show_hypersphere_help_message
      puts "Here are the methods for HyperSphere:"
      puts "#on?(point)"
      puts "#inside?(point)"
      puts "#outside?(point)"
      puts "#how_far(point)"
    end

    def self.show_sphere_help_message
      puts "The following methods are specific to a 3-dimensional Sphere:"
      puts "#volume"
      puts "#surface_area"
      puts "#equation, which returns a string in the form of (x-a)^2 + (y-b)^2 + (z-c)^2 = r^2"
    end

    def self.show_circle_help_message
      puts "The following methods are specific to a Circle (2-dimensions):"
      puts "#area"
      puts "#circumference"
      puts "#equation, which returns a string in the form of (x-a)^2 + (y-b)^2 = r^2"
    end
  end
end
