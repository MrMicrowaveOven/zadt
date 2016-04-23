require_relative '../spec_helper.rb'

describe Zadt::Universe do
  before :each do
    @uni = Zadt::Universe.new
    @pointa = @uni.add_point([0,0,0])
    @pointb = @uni.add_point([0,1,0])
    @pointc = @uni.add_point([3,0,4])
    @pointd = @uni.add_point([-1,0,-1])

    @uni3d = Zadt::Universe.new(4)
  end
  describe "#distance" do
    it "calculates simple distance between two points" do
      expect(@uni.distance(@pointa, @pointb)).to eq(1)
      expect(@uni.distance(@pointc, @pointa)).to eq(5)
      expect(@uni.distance(@pointb, @pointd)).to eq(Math.sqrt(3))
    end

    it "raises error if point doesn't exist in universe" do
      expect {@uni3d.distance(@pointc, @pointa)}.to raise_error("Wrong number of dimensions")
    end
  end
end
