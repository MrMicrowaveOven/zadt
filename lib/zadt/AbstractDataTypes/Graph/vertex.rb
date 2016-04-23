
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
      raise "not a vertex" unless other_vertex.is_a?(Vertex)
      raise "cannot connect vertex to self" if other_vertex == self
      raise "not an edge" unless edge.is_a?(Edge)
      raise "already connected" if is_connected?(other_vertex)
      # Store connection info in this vertex
      @edges << edge
      @connections << other_vertex
      edge
    end

    # Returns if another vertex is "connected" to this one
    def is_connected?(other_vertex)
      raise "not a vertex" unless other_vertex.is_a?(Vertex)
      @connections.include?(other_vertex)
    end

    def inspect
      description = "Vertex"
      description += ": empty" if @value.empty?
    end

  end
