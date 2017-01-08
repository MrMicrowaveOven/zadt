require_relative 'face.rb'
require_relative 'graph.rb'

module Zadt
  class FaceGraph < Graph
    # Made up of
    attr_reader :faces
    #   in addition to its parent's :vertices and :edges

    # Contains (inherits)
    # attr_accessor :value

    def initialize
      #@faces is ALL faces on the graph
      @faces = []
      super
    end

    def add_face(edges_array)
      edge_array_check(edges_array)
      face = Face.new(edges_array)
      @faces << face
      face
    end

    # Makes a face with num_edges edges, which will be attached to nothing.
    def make_original_face(num_edges)
      num_edges_check(num_edges)
      # Make the vertices
      vert_ref = Array.new(num_edges) {Vertex.new}
      edge_ref = []

      # Connect each vertex to the one before it (including the first one :)
      (num_edges).times do |vert_id|
        edge_ref << make_connection(vert_ref[vert_id - 1], vert_ref[vert_id])
      end

      # Make the face and store it
      face = add_face(edge_ref)
      # Store the new vertices
      @vertices += vert_ref
      # Store the new edges
      @edges += edge_ref

      face
    end

    # This adds a face that will be attached to the given vertices
    #   Make sure the vertices are connected, or it will raise an error
    # All new vertices and edges will be created
    # This will automatically make_neighbors with any faces that share
    #   a vertex with the new face
    def add_attached_face(vertex_array, num_edges)
      vertex_array_check(vertex_array)
      num_edges_check(num_edges)
      # Make the vertices into a line
      vertex_line = confirm_vertex_line(vertex_array)
      # This finds the "ends" of the vertex line
      end_vertices = [vertex_line.first, vertex_line.last]
      # Find the neighbors that will be added later
      new_neighbors = find_neighbors(vertex_array)
      # How many vertices and edges to be made
      vertices_to_make = num_edges - vertex_array.length
      edges_to_make = vertices_to_make + 1

      # Make new vertices
      vert_ref = Array.new(vertices_to_make) {Vertex.new}

      edge_ref = []
      # Connect new vertices in a line
      (edges_to_make - 2).times do |vert_id|
        # Connect each vertex to the one after it
        edge_ref << make_connection(vert_ref[vert_id], vert_ref[vert_id + 1])
      end
      # Connect "ends" of new vertices to "ends" of vertex line (making a circuit)
      # Connect "first" of new vertices to "last end" of old ones
      edge_ref << make_connection(vert_ref.first, end_vertices.last)
      # Connect "last" of new vertices to "first end" of old ones
      edge_ref << make_connection(vert_ref.last, end_vertices.first)

      # Add edges from vertex_line to edge_ref
      (vertex_line.length - 1).times do |vert_id|
        edge_ref << find_connection(vertex_line[vert_id], vertex_line[vert_id + 1])
      end

      face_border = edge_ref
      # Make a face out of the new circuit, and store it
      face = add_face(face_border)
      # Store the new vertices
      @vertices += vert_ref
      # Store the new edges
      @edges += edge_ref

      face
    end

    # Return all faces containing the given vertices
    def find_neighbors(vertex_array)
      vertex_array_check(vertex_array)
      neighbors = []
      vertex_array.each do |vertex|
        @faces.each do |face|
          neighbors << face if face.vertices.include?(vertex)
        end
      end
      neighbors.uniq
    end

    # Return all neighbors of the given faces
      # Neighbor is defined as sharing a vertex,
      # not necessarily sharing an edge.
    def find_face_neighbors(face)
      raise "not a face" unless face.is_a?(Face)
      neighbors = find_neighbors(face.vertices)
      neighbors - [face]
    end

    private

    def vertex_array_check(vertex_array)
      raise "invalid vertex array" unless vertex_array.is_a?(Array)
      vertex_array.each {|vertex| raise "not a vertex" unless vertex.is_a?(Vertex)}
    end

    def edge_array_check(edges_array)
      raise "not an array" unless edges_array.is_a?(Array)
      edges_array.each {|edge| raise "not an edge" unless edge.is_a?(Edge)}
    end

    def num_edges_check(num_edges)
      raise "invalid number of edges" unless num_edges.is_a?(Integer)
      raise "need 3 or more edgesto make a face" unless num_edges > 2
    end

    def confirm_vertex_line(vertex_array)
      (vertex_array.length - 1).times do |i|
        raise "Vertices not connected" unless vertex_array[i].is_connected?(vertex_array[i+1])
      end
      vertex_array
    end

    def make_neighbors(face1, face2)
      face1.add_neighbor(face2)
      face2.add_neighbor(face1)
    end

    def remove_neighbors(face1, face2)
      face2.remove_neighbor(face1)
      face1.remove_neighbor(face2)
    end
  end
end
