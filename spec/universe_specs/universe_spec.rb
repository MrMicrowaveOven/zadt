require_relative '../spec_helper.rb'

describe Zadt::Universe do
  before :each do
    @uni = Zadt::Universe.new
    @pointa = @uni.add_point([0,0,0])
    @pointb = @uni.add_point([0,1,0])
    @pointc = @uni.add_point([3,0,4])
    @pointd = @uni.add_point([-1,0,-1])
    @pointe = @uni.add_point([0,0,0,0])
    @uni3d = Zadt::Universe.new(4)
  end
  describe "#distance" do
    it "calculates simple distance between two points" do
      expect(Zadt::Universe.distance(@pointa, @pointb)).to eq(1)
      expect(Zadt::Universe.distance(@pointc, @pointa)).to eq(5)
      expect(Zadt::Universe.distance(@pointb, @pointd)).to eq(Math.sqrt(3))
    end

    it "raises error if vertices are in different dimensions" do
      expect {Zadt::Universe.distance(@pointc, @pointe)}.to raise_error("different dimensions")
    end
  end

  describe "#add_sphere" do
    before :each do
      @sphere1 = @uni.add_sphere(3, [0,1,2])
      @sphere2 = @uni.add_sphere(3, [0,1,3])
    end
    it "adds a sphere with the given radius and center" do
      expect(@uni.objects.first).to eq(@sphere1)
    end
    it "gives access to radius and center of sphere" do
      expect(@uni.objects.last.center.coords).to eq([0,1,3])
      expect(@uni.objects.first.radius).to eq(3)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@uni.help}.to output(/Universe/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::Universe.help}.to output(/Universe/).to_stdout
    end

    it "maintains standard Ruby Universe #methods" do
      expect(@uni.methods).to include(:add_sphere)
    end
  end
end
