class Point
  attr_reader :coords, :dims
  def initialize(coordinates)
    @coords = coordinates
    @dims = @coords.length
  end

  def self.help
    Point.show_help_message
  end

  def help
    Point.help
  end

  private

  def self.show_help_message
    Zadt::ADT::show_point_help_message
  end
end
