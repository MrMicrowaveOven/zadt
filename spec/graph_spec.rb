require_relative 'spec_helper.rb'

describe Zadt::Graph do
  before :each do
    @graph = Zadt::Graph.new
    @a = @graph.add_vertex
    @b = @graph.add_vertex
    @c = @graph.add_vertex
    @d = @graph.add_vertex
    @e = @graph.add_vertex
    @f = @graph.add_vertex
    @A = @graph.make_connection(@a, @b)
    @B = @graph.make_connection(@b, @c)
    @C = @graph.make_connection(@e, @f)

  end
  describe "#make_connection" do
    it "makes connections with b and a and c" do
      expect(@b.connections).to eq([@a, @c])
    end

    it "saves the edge connections" do
      expect(@b.edges).to eq([@A, @B])
      expect(@C.connection).to eq([@e, @f])
      expect(@graph.edges).to eq([@A, @B, @C])
    end

    it "raises error when connection already exists" do
      expect {@graph.make_connection(@a,@b)}.to raise_error("already connected")
    end
  end

  describe "#break_connection" do
    it "breaks connections with a and b" do
      @graph.break_connection(@a, @b)
      expect(@a.connections).to eq([])
      expect(@b.connections).to eq([@c])
      expect(@graph.edges).to eq([@B, @C])
    end
  end

  describe "#remove_vertex" do
    it "removes an unconnected vertex from the catalog" do
      @graph.break_connection(@a, @b)
      @graph.remove_vertex(@a)
      expect(@graph.vertices).to eq([@b, @c, @d, @e, @f])
    end
    it "raises error if vertex has connections" do
      expect {@graph.remove_vertex(@e)}.to raise_error("Vertex has edges.  Break them first.")
    end
  end

  describe "#is_connected?" do
    it "returns true if vertices are connected" do
      expect(@graph.is_connected?(@e, @f)).to eq(true)
    end
    it "returns false if vertices are not connected" do
      expect(@graph.is_connected?(@e, @d)).to eq(false)
    end
  end

  describe "#find_connection" do
    it "returns the edge connecting two vertices" do
      expect(@graph.find_connection(@a,@b)).to eq(@A)
    end
    it "returns nil if the vertices are unconnected" do
      @graph.break_connection(@a,@b)
      expect(@graph.find_connection(@a,@b)).to eq(nil)
    end
  end

  describe "#help_methods" do
    it "has valid help methods: #help and #methods" do
      expect {@graph.methods}.to output(/Graph/).to_stdout
      expect {@graph.help}.to output(/Graph/).to_stdout
    end

    it "has class help methods" do
      expect {Zadt::Graph.methods}.to output(/Graph/).to_stdout
      expect {Zadt::Graph.help}.to output(/Graph/).to_stdout
    end
  end

end
