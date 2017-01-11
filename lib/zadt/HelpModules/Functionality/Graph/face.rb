module Zadt
  class Face
    def help
      Face.help
    end

    def self.help
      Face.show_help_message
    end

    private

    def self.show_help_message
      Zadt::ADT::show_face_help_message
    end
  end
end
