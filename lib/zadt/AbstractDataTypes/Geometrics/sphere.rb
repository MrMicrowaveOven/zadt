require_relative "hypersphere.rb"

class Sphere < HyperSphere

  def initialize(radius = 1, center = [0,0,0], pct_error = 1)
    super(radius, center, pct_error)
  end

  def volume
    dim_check(3)
    Math::PI * (@radius ** 3) * 4.0 / 3.0
  end

  def surface_area
    dim_check(3)
    4.0 * Math::PI * (@radius ** 2)
  end

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
