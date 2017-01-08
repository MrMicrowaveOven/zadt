require_relative "../../../AbstractDataTypes/Geometrics/hypersphere.rb"

class Circle < HyperSphere
  def help
    Circle.help
  end

  def self.help
    Circle.show_help_message
  end

  private

  def self.show_help_message
    super
    Zadt::ADT::show_circle_help_message
  end
end
