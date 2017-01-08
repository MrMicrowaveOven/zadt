module Zadt
  class Universe
    def self.help
      Universe.show_help_message
    end

    def help
      Universe.help
    end
    
    private

    def self.show_help_message
      Zadt::ADT::show_universe_help_message
    end
  end
end
