require_relative '../spec_helper.rb'

describe Zadt::Face do

  before :each do
    @graph = Zadt::Graph.new
    @a = @graph.add_vertex
    @b = @graph.add_vertex
    @c = @graph.add_vertex
    @A = @graph.make_connection(@a,@b)
    @B = @graph.make_connection(@b,@c)
    @C = @graph.make_connection(@a,@c)
    @d = @graph.add_vertex
    @D = @graph.make_connection(@d,@b)
    @goodface1 = Zadt::Face.new([@B, @A, @C])
    @e = @graph.add_vertex
    @E = @graph.make_connection(@e,@a)
    @F = @graph.make_connection(@c,@e)
    @goodface2 = Zadt::Face.new([@C, @E, @F])

    # Disconnected face
    @x = @graph.add_vertex
    @y = @graph.add_vertex
    @z = @graph.add_vertex
    @X = @graph.make_connection(@x,@y)
    @Y = @graph.make_connection(@y,@z)
    @Z = @graph.make_connection(@x,@z)
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

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@disface.help}.to output(/Face/).to_stdout
    end
    it "has class help method" do
      expect {Zadt::Face.help}.to output(/Face/).to_stdout
    end
    it "maintains standard Ruby Face #methods" do
      expect(@disface.methods).to include(:edges)
    end
  end

end
