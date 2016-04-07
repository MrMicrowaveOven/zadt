require_relative 'spec_helper.rb'

describe Zadt::Face do

  before :each do
    @a = Zadt::Vertex.new
    @b = Zadt::Vertex.new
    @c = Zadt::Vertex.new
    @A = @a.connect(@b)
    @B = @b.connect(@c)
    @C = @a.connect(@c)
    @d = Zadt::Vertex.new
    @D = @d.connect(@b)
    @goodface1 = Zadt::Face.new([@B, @A, @C])
    @e = Zadt::Vertex.new
    @E = @e.connect(@a)
    @F = @c.connect(@e)
    @goodface2 = Zadt::Face.new([@C, @E, @F])

    # Disconnected face
    @x = Zadt::Vertex.new
    @y = Zadt::Vertex.new
    @z = Zadt::Vertex.new
    @X = @x.connect(@y)
    @Y = @y.connect(@z)
    @Z = @x.connect(@z)
    @disface = Zadt::Face.new([@X, @Y, @Z])

  end

  describe "#initialize" do
    it "makes the face with the edges" do
      expect(@goodface1.edges).to match_array([@A, @B, @C])
    end
    it "includes the contained vertices" do
      expect(@goodface2.vertices).to match_array([@a, @e, @c])
    end
    it "raises error if edges aren't cyclic" do
      expect {Zadt::Face.new([@D, @A, @B])}.to raise_error("Not cyclic edges")
    end
  end

  describe "#add_neighbor" do
    it "adds a neighbor" do
      @goodface1.add_neighbor(@goodface2)
      vert_share = @goodface1.neighboring_faces[0]["shared_vertices"]
      expect(vert_share).to match_array([@a, @c])
    end
    it "raises error if no elements are shared" do
      expect {@goodface1.add_neighbor(@disface)}.to raise_error("No connecting edges or vertices")
    end
  end

  describe "#remove_neighbor" do
    it "removes a neighbor (only one way)" do
      @goodface1.add_neighbor(@goodface2)
      @goodface1.remove_neighbor(@goodface2)
      expect(@goodface1.neighboring_faces.length).to eq(0)
    end

    it "returns error if they aren't neighbors" do
      expect {@goodface1.remove_neighbor(@disface)}.to raise_error("Not a neighbor")
    end
  end

end