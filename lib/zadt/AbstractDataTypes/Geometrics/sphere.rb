require_relative "hypersphere.rb"

class Sphere < HyperSphere


  def volume
    dim_check(3)
    Math::PI * (@radius ** 3) * 4.0 / 3.0
  end

  def surface_area
    dim_check(3)
    4.0 * Math::PI * (@radius ** 2)
  end

  # def equation
  #   dim_check(3)
  #   center_point = @center.dup
  #   coord_names = ["x", "y", "z"]
  #   center_point.coords.each_with_index do |center_coord, index|
  #     if center_coord == 0
  #       # coord_name is fine
  #     elsif center_coord < 0
  #       coord_names[index] = "(#{coord_names[index]} + #{-center_coord})"
  #     else
  #       coord_names[index] = "(#{coord_names[index]} - #{center_coord})"
  #     end
  #   end
  #   "#{coord_names[0]}^2 + #{coord_names[1]}^2 + #{coord_names[2]}^2 = #{@radius ** 2}"
  # end

  def inspect
    "Sphere: #{equation}"
  end

  private

  def self.show_help_message
    super
    Zadt::ADT::show_sphere_help_message
  end

  def close_enough(guess, exact)
    range = Array.new
    range[0] = exact *(100.0 - @pct_error)/100.0
    range[1] = exact * (100.0 + @pct_error)/100.0
    guess.between?(range[0], range[1])
  end

end
