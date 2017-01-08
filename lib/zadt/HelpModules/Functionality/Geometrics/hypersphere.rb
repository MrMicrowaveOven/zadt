class HyperSphere
  def self.help
    Sphere.show_help_message
  end

  def help
    Sphere.help
  end

  private

  def self.show_help_message
    Zadt::ADT::show_hypersphere_help_message
  end

end
