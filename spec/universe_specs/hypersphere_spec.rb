require_relative '../spec_helper.rb'

describe HyperSphere do
  describe "#initialize" do
    it "makes a hypersphere with the given radius and center point" do
      sphere1 = HyperSphere.new(3,[1,2,3,4])
      expect(sphere1.radius).to eq(3)
      expect(sphere1.center.coords).to eq([1,2,3,4])
    end
    it "defaults to a unit 4d hypersphere" do
      default_sphere = HyperSphere.new
      expect(default_sphere.radius).to eq(1)
      expect(default_sphere.center.coords).to eq([0,0,0,0])
    end
    it "can make a 1d hypersphere" do
      sphere5d = HyperSphere.new(2, [3])
      expect(sphere5d.radius).to eq(2)
      expect(sphere5d.center.coords).to eq([3])
    end
    it "can make a 5d hypersphere" do
      sphere5d = HyperSphere.new(2, [1,2,3,4,5])
      expect(sphere5d.radius).to eq(2)
      expect(sphere5d.center.coords).to eq([1,2,3,4,5])
    end
  end
  before :each do
    @hsph1 = HyperSphere.new(2)
    @point_on_hsph1 = Point.new([0,2,0,0])
    @point_not_on_hsph1 = Point.new([1,2,0,0])
    @point_in_hsph1 = Point.new([1,1,0,0])
    @point_not_in_hsph1 = Point.new([1,3,0,0])

    @hsph2 = HyperSphere.new(2, [0,3,-5,0])
    @point_one_away_from_hsph2 = Point.new([0,2,-5,0])
    @point_two_outside_of_hsph2 = Point.new([-4,3,-5,0])

    @sph4d = HyperSphere.new(3, [0,0,0,2])
  end

  describe "#on?" do
    it "returns true for a simple point on the sphere" do
      expect(@hsph1.on?(@point_on_hsph1)).to eq(true)
    end
    it "returns false for a simple point not on the sphere" do
      expect(@hsph1.on?(@point_not_on_hsph1)).to eq(false)
    end
  end

  describe "#how_far" do
    it "returns zero when a point is on the sphere" do
      expect(@hsph1.how_far(@point_on_hsph1)).to eq(0)
    end
    it "gives distance from sphere (inside)" do
      expect(@hsph2.how_far(@point_one_away_from_hsph2)).to eq(1)
    end
    it "gives distance from sphere (outside)" do
      expect(@hsph2.how_far(@point_two_outside_of_hsph2)).to eq(2)
    end
  end

  describe "#inside?" do
    it "returns true for a simple point in the sphere" do
      expect(@hsph1.inside?(@point_in_hsph1)).to eq(true)
    end
    it "returns false for a simple point not in the sphere" do
      expect(@hsph1.inside?(@point_not_in_hsph1)).to eq(false)
    end
  end

  describe "#outside?" do
    it "returns true for a simple point out of the sphere" do
      expect(@hsph1.outside?(@point_not_in_hsph1)).to eq(true)
    end
    it "returns false for a simple point in the sphere" do
      expect(@hsph1.outside?(@point_in_hsph1)).to eq(false)
    end
  end

  describe "#equation" do
    it "returns equation for basic centered sphere" do
      expect(@hsph1.equation).to eq("w^2 + x^2 + y^2 + z^2 = 4")
    end
    it "returns equation for uncentered sphere" do
      expect(@hsph2.equation).to eq("w^2 + (x - 3)^2 + (y + 5)^2 + z^2 = 4")
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@hsph1.help}.to output(/HyperSphere/).to_stdout
    end

    it "has class help method" do
      expect {HyperSphere.help}.to output(/HyperSphere/).to_stdout
    end

    it "maintains standard Ruby HyperSphere #methods" do
      expect(@hsph1.methods).to include(:outside?)
    end
  end
end
