module Zadt
  class Graph
    def help
      Graph.help
    end

    def self.help
      Graph.show_help_message
    end

    private

    def self.show_help_message
      Zadt::ADT::show_graph_help_message
    end
  end
end
