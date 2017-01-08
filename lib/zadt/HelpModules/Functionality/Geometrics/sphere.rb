require_relative "hypersphere.rb"

class Sphere < HyperSphere

  private

  def self.show_help_message
    super
    Zadt::ADT::show_sphere_help_message
  end

end
