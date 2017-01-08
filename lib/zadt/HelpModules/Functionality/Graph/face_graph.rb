require_relative "../../../AbstractDataTypes/Graph/face_graph.rb"
module Zadt
  class FaceGraph < Graph
    def self.help
      FaceGraph.show_help_message
    end

    def help
      FaceGraph.help
    end

    private

    def self.show_help_message
      Zadt::ADT::show_face_graph_help_message
    end
  end
end
