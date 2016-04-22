
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

    # Make an edge between this vertex and another
    def connect(other_vertex, edge)
      return nil if !other_vertex.is_a?(Vertex) || other_vertex == self
      raise "already connected" if is_connected?(other_vertex)
      # Store connection info in this vertex
      @edges << edge
      @connections << other_vertex
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

  end
