require_relative 'edge.rb'
module Zadt
  class Vertex
    attr_accessor :edges, :connections
    def initialize
      # List of edges attached to vertex
      @edges = []
      # List of vertices "connected" to this one
      @connections = []
    end

    # Make an edge between this vertex and another
    def connect(other_vertex)
      return nil if !other_vertex
      raise "already connected" if is_connected?(other_vertex)

      edge = Edge.new(self, other_vertex)
      # Store connection info in this vertex
      @edges << edge
      @connections << other_vertex
      # Store connection info in other vertex
      other_vertex.store_connection_info(self, edge)
      edge
    end

    # Returns if another vertex is "connected" to this one
    def is_connected?(other_vertex)
      @connections.include?(other_vertex)
    end

    # Used to store connection info in the second vertex
    #  involved in a connection
    def store_connection_info(vertex, edge)
      @edges << edge
      @connections << vertex
    end

    def inspect
      "Vertex"
    end
  end
end
