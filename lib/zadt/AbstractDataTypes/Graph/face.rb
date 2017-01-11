  class Face
    attr_reader :edges, :vertices
    # Contains
    attr_accessor :value

    def initialize(edges_array, value = Hash.new)
      raise "not enough edges" if edges_array.length < 3
      edges_array.each {|edge| raise "not an edge" unless edge.is_a?(Edge)}
      @edges = edges_array
      vertices = edges_array.map{ |edge| edge.connection}.inject(:+).uniq
      @vertices = ensure_cyclic(vertices)
      @value = value
    end

    def inspect
      output = "This face contains the following vertices:"
      output += @vertices.to_s
      output = "This face contains the following edges:"
      output += @edges.to_s
      output
    end

    private
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
  end
