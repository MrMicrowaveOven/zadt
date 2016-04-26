module Zadt
  class ADT
    def self.show_universe_help_message
      puts "Here are the methods for Universe:"
      puts "#add_point(coordinates)"
      puts "#add_sphere(radius, center)"
      puts "#self.distance(pointA, pointB)"
    end

    def self.show_sphere_help_message
      puts "Here are the methods for Sphere:"
      puts "#on_sphere(point)"
      puts "#in_sphere(point)"
      puts "#how_far_from_sphere(point)"
      puts "The following methods are also included in a 3-dimensional sphere:"
      puts "#volume"
      puts "#surface_area"
      puts "#equation, which returns a string in the form of (x-a)^2 + (y-b)^2 + (z-c)^2 = r^2"
    end
  end
end
