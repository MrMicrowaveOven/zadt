require_relative 'point.rb'

class HyperSphere
  attr_reader :radius, :center
  attr_accessor :pct_error

  def initialize(radius = 1, center = [0,0,0], pct_error = 1)
    @radius = radius
    @center = Point.new(center)
    @pct_error = pct_error
  end

  def self.help
    Sphere.show_help_message
  end

  def help
    Sphere.help
  end

  def on_sphere?(point)
    Zadt::Universe.distance(@center, point).round(2) == radius.round(2)
  end

  def in_sphere?(point)
    Zadt::Universe.distance(@center, point) <= @radius
  end

  def out_of_sphere?(point)
    !in_sphere?(point)
  end

  def how_far_from_sphere(point)
    (@radius - Zadt::Universe.distance(@center, point)).abs
  end

  def equation
    dims = @center.dims
    return circle_equation if dims == 2
    center_point = @center.dup
    # Only get the variables used in that dimension
    coord_names = ("a".."z").to_a.slice(-dims, dims)
    center_point.coords.each_with_index do |center_coord, index|
      if center_coord == 0
        # coord_name is fine
      elsif center_coord < 0
        coord_names[index] = "(#{coord_names[index]} + #{-center_coord})"
      else
        coord_names[index] = "(#{coord_names[index]} - #{center_coord})"
      end
    end
    final_string = ""
    (dims - 1).times do |index|
      final_string += "#{coord_names[index]}^2 + "
    end
    final_string += "#{coord_names[dims - 1]}^2"
    final_string += " = "
    final_string += "#{@radius ** 2}"
    final_string
  end

  private

  def dim_check(num)
    raise "dimension error" unless num == @center.dims
  end

  def self.show_help_message
    Zadt::ADT::show_hypersphere_help_message
  end

end
