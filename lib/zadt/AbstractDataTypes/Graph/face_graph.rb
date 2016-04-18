require_relative 'face.rb'
require_relative 'graph.rb'

module Zadt
  class FaceGraph < Graph
    attr_reader :faces

    def initialize
      #@faces is ALL faces on the graph
      @faces = []
      super
    end

    def self.help
      puts "Here are the functions for FaceGraph:"
      puts "#add_face(edges_array), makes a face with the given edges (must be cyclicly connected)"
      puts "#make_original_face(num_edges), which makes a standard disconnected face"
      puts "#add_attached_face(vertex_array, num_edges), which adds a face connected to the vertex_array"
      puts "#find_neighbors(vertex_array), lists all faces containing the given vertices"
      puts "#find_face_neighbors(vertex_array), which finds all neighbors of the given face"
      puts "--a neighbor of a face is defined as one that shares a vertex (not necessarily an edge)"
      puts "#make_vertex_line(vertex_array), reorders a list of connected vertices by connection sequence"
      puts ""
      puts "FaceGraph also inherits the following functions from Graph:"
      puts "#add_vertex"
      puts "#remove_vertex(vertex)"
      puts "#make_connection(v1,v2), adds an edge between two vertices"
      puts "#break_connection(v1,v2)"
      puts "#find_connection(v1,v2), returns edge connecting two given vertices"
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

    def add_face(edges_array)
      face = Face.new(edges_array)
      @faces << face
      face
    end

    # Makes a face with num_edges edges, which will be attached to nothing.
    def make_original_face(num_edges)

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
      # Make the vertices into a line
      vertex_line = make_vertex_line(vertex_array)
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

      new_neighbors.each do |neighbor|
        # Add all the new_neighbors
        face.add_neighbor(neighbor)
        # Make this a neighbor to all new_neighbors
        neighbor.add_neighbor(face)
      end
      face
    end

    # Return all faces containing the given vertices
    def find_neighbors(vertex_array)
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
      neighbors = find_neighbors(face.vertices)
      neighbors - [face]
    end

    def make_vertex_line(vertex_array)
      connection_line = []
      connection_line << vertex_array.first
      continue = true
      until connection_line.length == vertex_array.length || !continue
        continue = false
        vertex_array.each do |vertex|
          if vertex.is_connected?(connection_line.last) && !connection_line.include?(vertex)
            continue = true
            connection_line << vertex
          end
        end
        raise "Vertices not connected" if continue == false
      end
      connection_line
    end
    private
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
