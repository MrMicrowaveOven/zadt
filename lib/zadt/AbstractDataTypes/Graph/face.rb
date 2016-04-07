# require_relative 'vertex.rb'
# require_relative 'edge.rb'
module Zadt
  class Face
    attr_reader :edges, :vertices, :neighboring_faces
    def initialize(edges_array, neighboring_faces = {})
      raise "Not enough edges" if edges_array.length < 3
      @edges = edges_array
      vertices = edges_array.map{ |edge| edge.connection}.inject(:+).uniq
      @vertices = ensure_cyclic(vertices)
      @neighboring_faces = neighboring_faces
      @neighbor_id = @neighboring_faces.length
    end

    def add_neighbor(face)
      # face_info is a catalog of information about the face's neighbor
      # It has three properties: face, which is the neighbor face itself,
        # as well as "shared_vertices" and "shared_edges".
      face_info = {}
      face_info["face"] = face
      face_info["shared_vertices"] = @vertices.select{|vertex| face.vertices.include?(vertex)}
      face_info["shared_edges"] = @edges.select{|edge| face.edges.include?(edge)}
      raise "No connecting edges or vertices" if face_info["shared_vertices"].empty? && face_info["shared_edges"].empty?
      @neighboring_faces[@neighbor_id] = face_info
      @neighbor_id += 1
    end

    def remove_neighbor(neighbor)
      id_of_neighbor = -1
      @neighboring_faces.each do |id, face_info|
        id_of_neighbor = id if face_info["face"] == neighbor
      end
      raise "Not a neighbor" if id_of_neighbor == -1
      @neighboring_faces.delete(id_of_neighbor)
    end

    def ensure_cyclic(vertices)
      connect_testers = vertices.dup
      connected_vertices = []
      connected_vertices << connect_testers.pop
      until connected_vertices.length == vertices.length
        continue = false
        connect_testers.each do |vert|
          if (connected_vertices.last).is_connected?(vert)
            connected_vertices << vert
            continue = true
            break
          end
        end
        connect_testers.delete(connected_vertices.last)
        raise "Not cyclic edges" if continue == false
      end
      connected_vertices
    end

    def inspect
      output = "This face contains the following vertices:"
      output += @vertices.to_s
      output = "This face contains the following edges:"
      output += @edges.to_s
      output
    end

  end
end
