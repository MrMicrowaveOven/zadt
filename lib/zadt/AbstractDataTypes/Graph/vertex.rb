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

    def self.help
      puts "Here are the functions for Vertex:"
      puts "#connect(other_vertex)"
      puts "#is_connected?(other_vertex)"
      puts "#make_connection(v1,v2)"
      puts "#break_connection(v1,v2)"
      puts "#find_connection(v1,v2)"
      puts "#is_connected?(v1,v2)"
    end

    def self.methods
      self.help
    end

    def help
      self.help
    end

    def methods
      help
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

    def inspect
      "Vertex"
    end

    # Used to store connection info in the second vertex
    #  involved in a connection
    # Must needs be public, since it's called by a different vertex
    def store_connection_info(vertex, edge)
      @edges << edge
      @connections << vertex
    end

  end
end
