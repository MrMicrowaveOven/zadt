require_relative 'vertex.rb'
require_relative 'edge.rb'
module Zadt
  class Graph
    # Made up of
    attr_reader :vertices

    # Which are connected by
    attr_reader :edges

    # Contains
    attr_accessor :value

    #init_v allows for initial vertices (not generally used)
    def initialize
      #@vertices is ALL vertices on the graph
      @vertices = []
      #@edges is ALL edges on the graph
      @edges = []
      @value = Hash.new
    end

    def help
      Graph.help
    end

    def self.help
      Graph.show_help_message
    end

    # Add a vertex
    def add_vertex
      vertex = Vertex.new
      @vertices << vertex
      vertex
    end

    # Remove a vertex
    def remove_vertex(vertex)
      # The vertex must exist
      raise "not a vertex" unless vertex.is_a?(Vertex)
      if !vertex
        raise "Vertex does not exist"
      # The vertex must not be connected to anything
      elsif !vertex.connections.empty?
        raise "Vertex has edges.  Break them first."
      # If it exists and isn't connected, delete it
      else
        @vertices.delete(vertex)
      end
    end

    # Make an edge between two vertices
    def make_connection(v1, v2)
      raise "not a vertex" unless v1.is_a?(Vertex) && v2.is_a?(Vertex)
      raise "already connected" if is_connected?(v1, v2)
      # Make new edge
      edge = Edge.new(v1, v2)
      # Connect the two using the vertex method "connect"
      v1.connect(v2, edge)
      v2.connect(v1, edge)

      # Add to edge catalog
      @edges << edge
      edge
    end

    # Find the edge connecting two vertices
    def find_connection(v1, v2)
      raise "not a vertex" unless v1.is_a?(Vertex) && v2.is_a?(Vertex)
      raise "Vertices not connected" if !is_connected?(v1, v2)
      connection = v1.edges.select {|edge| edge.connection.include?(v2)}
      raise "Error finding connection" if connection.length > 1
      connection.first
    end

    # Returns whether two vertices are connected
    def is_connected?(v1, v2)
      raise "not a vertex" unless v1.is_a?(Vertex) && v2.is_a?(Vertex)
      v1.connections.include?(v2)
    end

    def break_connection(v1, v2)
      raise "First vertex does not exist" if !v1
      raise "Second vertex does not exist" if !v2

      if is_connected?(v1, v2)
        # Find edge
        edge = find_connection(v1, v2)
        # Remove edge from edges catalog
        @edges.delete(edge)
        #Remove edge from vertices
        v1.edges.delete(edge)
        v2.edges.delete(edge)
        v1.connections.delete(v2)
        v2.connections.delete(v1)
      else
        raise "Vertices are not connected"
      end
    end

    private

    def self.show_help_message
      puts "Here are the methods for Graph:"
      puts "#add_vertex"
      puts "#remove_vertex(vertex)"
      puts "#make_connection(v1,v2), adds an edge between two vertices"
      puts "#break_connection(v1,v2)"
      puts "#find_connection(v1,v2), returns edge connecting two given vertices"
      puts "#is_connected?(v1,v2)"
    end
  end
end
