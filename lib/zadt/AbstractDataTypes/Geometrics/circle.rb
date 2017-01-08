require_relative "hypersphere.rb"

class Circle < HyperSphere

  def initialize(radius = 1, center = [0,0], pct_error = 1)
    super(radius, center, pct_error)
  end

  def area
    dim_check(2)
    Math::PI * (@radius ** 2)
  end

  def circumference
    dim_check(2)
    2 * Math::PI * @radius
  end

  def inspect
    "Circle: #{equation}"
  end

  private

  def circle_equation
    dim_check(2)
    center_point = @center.dup
    coord_names = ["x", "y"]
    center_point.coords.each_with_index do |center_coord, index|
      if center_coord == 0
        # coord_name is fine
      elsif center_coord < 0
        coord_names[index] = "(#{coord_names[index]} + #{-center_coord})"
      else
        coord_names[index] = "(#{coord_names[index]} - #{center_coord})"
      end
    end
    "#{coord_names[0]}^2 + #{coord_names[1]}^2 = #{@radius ** 2}"
  end

  def close_enough(guess, exact)
    range = Array.new
    range[0] = exact *(100.0 - @pct_error)/100.0
    range[1] = exact * (100.0 + @pct_error)/100.0
    guess.between?(range[0], range[1])
  end



end
