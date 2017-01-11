module Zadt
  class ADT
    def self.show_graph_help_message
      puts "Here are the methods for Graph:"
      puts "#add_vertex"
      puts "#remove_vertex(vertex)"
      puts "#make_connection(v1,v2), adds an edge between two vertices"
      puts "#break_connection(v1,v2)"
      puts "#find_connection(v1,v2), returns edge connecting two given vertices"
      puts "#is_connected?(v1,v2)"
    end

    def self.show_face_graph_help_message
      puts "Here are the methods for FaceGraph:"
      puts "#add_face(edges_array), makes a face with the given edges (must be cyclicly connected)"
      puts "#make_original_face(num_edges), which makes a standard disconnected face"
      puts "#add_attached_face(vertex_array, num_edges), which adds a face connected to the vertex_array"
      puts "#find_neighbors(vertex_array), lists all faces containing the given vertices"
      puts "#find_face_neighbors(face), which finds all neighbors of the given face"
      puts "--a neighbor of a face is defined as one that shares a vertex (not necessarily an edge)"
      puts ""
      puts "FaceGraph also inherits the following methods from Graph:"
      puts "#add_vertex"
      puts "#remove_vertex(vertex)"
      puts "#make_connection(v1,v2), adds an edge between two vertices"
      puts "#break_connection(v1,v2)"
      puts "#find_connection(v1,v2), returns edge connecting two given vertices"
      puts "#is_connected?(v1,v2)"
    end

    def self.show_face_help_message
      puts "Here are the methods for FaceGraph:"
      puts "#edges, gets the edges contained within the face"
      puts "#vertices, gets the vertices contained within the face"
      puts "#value, gets/sets the value of the face"
    end
  end
end
