require_relative '../spec_helper.rb'

describe Zadt::FaceGraph do
  before :each do
    @facegraph = Zadt::FaceGraph.new
    @a = @facegraph.add_vertex
    @b = @facegraph.add_vertex
    @c = @facegraph.add_vertex
    @d = @facegraph.add_vertex
    @e = @facegraph.add_vertex
    @f = @facegraph.add_vertex
    @A = @facegraph.make_connection(@a, @b)
    @B = @facegraph.make_connection(@b, @c)
    @C = @facegraph.make_connection(@c, @a)

    @D = @facegraph.make_connection(@d, @b)

    @goodface1 = @facegraph.add_face([@B, @A, @C])
    @E = @facegraph.make_connection(@e, @a)
    @F = @facegraph.make_connection(@c, @e)
    @goodface2 = @facegraph.add_face([@C, @E, @F])

    # Disconnected face
    @x = @facegraph.add_vertex
    @y = @facegraph.add_vertex
    @z = @facegraph.add_vertex
    @X = @facegraph.make_connection(@x, @y)
    @Y = @facegraph.make_connection(@y, @z)
    @Z = @facegraph.make_connection(@x, @z)
    @disface = @facegraph.add_face([@X, @Y, @Z])
  end
  describe "#add_face" do
    it "makes a face with the given edges" do
      expect(@goodface1.edges).to match_array([@A, @B, @C])
      expect(@goodface2.edges).to match_array([@E, @C, @F])
    end
    it "contains the vertices of the edges" do
      expect(@goodface1.vertices).to match_array([@a, @b, @c])
      expect(@goodface2.vertices).to match_array([@e, @c, @a])
    end
  end
  describe "#add_face" do
    it "makes a face with the given edges" do
      expect(@goodface1.edges).to match_array([@A, @B, @C])
      expect(@goodface2.edges).to match_array([@E, @C, @F])
    end
    it "contains the vertices of the edges" do
      expect(@goodface1.vertices).to match_array([@a, @b, @c])
      expect(@goodface2.vertices).to match_array([@e, @c, @a])
    end
  end
  describe "#make_original_face" do
    it "makes a face" do
      orig_face = @facegraph.make_original_face(4)
      expect(orig_face.vertices.length).to eq(4)
      expect(orig_face.edges.length).to eq(4)
    end
    it "makes a disconnected face" do
      orig_face = @facegraph.make_original_face(4)
      disconnected = true
      orig_face.vertices.each do |vertex|
        disconnected = false if vertex.is_connected?(@a)
      end
      expect(disconnected).to eq(true)
    end
  end
  describe "#find_neighbors" do
    it "returns all neighbors of a face" do
      expect(@facegraph.find_neighbors([@c])).to match_array([@goodface2, @goodface1])
    end
    it "returns an empty array given an empty array" do
      expect(@facegraph.find_neighbors([])).to eq([])
    end
  end
  describe "#find_face_neighbors" do
    it "returns all neighbors of a face" do
      expect(@facegraph.find_face_neighbors(@goodface1)).to match_array([@goodface2])
    end
    it "returns an empty array given an empty array" do
      expect(@facegraph.find_neighbors([])).to eq([])
    end
  end
  describe "#add_attached_face" do
    it "makes an attached face" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      expect(face.vertices.length).to eq(4)
      expect(face.edges.length).to eq(4)
    end
    it "includes all neighbors" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      neighbors = @facegraph.find_face_neighbors(face)
      expect(neighbors.include?(@goodface1)).to eq(true)
      expect(neighbors.include?(@goodface2)).to eq(true)
    end
    # TODO: Finish this spec
    it "adds the new face as a neighbor to its neighbors" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      neighbors = @facegraph.find_face_neighbors(@goodface1)
      expect(neighbors.include?(face)).to eq(true)
    end
    it "connects each of its vertices" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      expect(@facegraph.is_connected?(face.vertices[0], face.vertices[1])).to eq(true)
      expect(@facegraph.is_connected?(face.vertices[1], face.vertices[2])).to eq(true)
      expect(@facegraph.is_connected?(face.vertices[2], face.vertices[3])).to eq(true)
      expect(@facegraph.is_connected?(face.vertices[3], face.vertices[0])).to eq(true)
    end
  end
  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@facegraph.help}.to output(/Graph/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::FaceGraph.help}.to output(/Graph/).to_stdout
    end

    it "maintains standard Ruby FaceGraph #methods" do
      expect(@facegraph.methods).to include(:add_vertex)
    end
    it "maintains standard Ruby Face #methods" do
      expect(@goodface2.methods).to include(:edges)
    end
  end
end
