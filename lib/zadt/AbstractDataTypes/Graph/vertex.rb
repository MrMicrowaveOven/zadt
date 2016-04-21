module Zadt
  class Vertex
    # Connected by
    attr_accessor :edges

    # Connected with
    attr_accessor :connections

    # Contains
    attr_accessor :value

    def initialize(value = Hash.new)
      # List of edges attached to vertex
      @edges = []
      # List of vertices "connected" to this one
      @connections = []
      @value = value
    end

    def self.methods
      self.help
    end

    # Make an edge between this vertex and another
    def connect(other_vertex)
      return nil if !other_vertex.is_a?(Vertex) || other_vertex == self
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
      description = "Vertex"
      description += ": empty" if @value.empty?
    end

    # Used to store connection info in the second vertex
    #  involved in a connection
    # Must needs be public, since it's called by a different vertex
    def store_connection_info(vertex, edge)
      @edges << edge
      @connections << vertex
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

    def help
      Vertex.methods
    end

    def methods
      help
    end
    private
  end
end
