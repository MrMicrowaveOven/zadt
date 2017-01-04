require_relative '../spec_helper.rb'

describe Sphere do
  describe "#initialize" do
    it "makes a sphere with the given radius and center point" do
      sphere1 = Sphere.new(3,[1,2,3])
      expect(sphere1.radius).to eq(3)
      expect(sphere1.center.coords).to eq([1,2,3])
    end
    it "defaults to a unit 3d sphere" do
      default_sphere = Sphere.new
      expect(default_sphere.radius).to eq(1)
      expect(default_sphere.center.coords).to eq([0,0,0])
    end
    it "raises error if sphere's center is not 3-dimensions" do
      expect{Sphere.new(2, [1,2,3,4,5])}.to raise_error("Sphere must be in 3-dimensions")
    end
  end
  before :each do
    @sph1 = Sphere.new(2)
    @point_on_sph1 = Point.new([0,2,0])
    @point_not_on_sph1 = Point.new([1,2,0])
    @point_in_sph1 = Point.new([1,1,0])
    @point_not_in_sph1 = Point.new([1,3,0])

    @sph2 = Sphere.new(2, [0,3,-5])
    @point_one_away_from_sph2 = Point.new([0,2,-5])
    @point_two_outside_of_sph2 = Point.new([-4,3,-5])
  end

  describe "#on?" do
    it "returns true for a simple point on the sphere" do
      expect(@sph1.on?(@point_on_sph1)).to eq(true)
    end
    it "returns false for a simple point not on the sphere" do
      expect(@sph1.on?(@point_not_on_sph1)).to eq(false)
    end
  end

  describe "#how_far" do
    it "returns zero when a point is on the sphere" do
      expect(@sph1.how_far(@point_on_sph1)).to eq(0)
    end
    it "gives distance from sphere (inside)" do
      expect(@sph2.how_far(@point_one_away_from_sph2)).to eq(1)
    end
    it "gives distance from sphere (outside)" do
      expect(@sph2.how_far(@point_two_outside_of_sph2)).to eq(2)
    end
  end

  describe "#inside?" do
    it "returns true for a simple point in the sphere" do
      expect(@sph1.inside?(@point_in_sph1)).to eq(true)
    end
    it "returns false for a simple point not in the sphere" do
      expect(@sph1.inside?(@point_not_in_sph1)).to eq(false)
    end
  end

  describe "#outside?" do
    it "returns true for a simple point out of the sphere" do
      expect(@sph1.outside?(@point_not_in_sph1)).to eq(true)
    end
    it "returns false for a simple point in the sphere" do
      expect(@sph1.outside?(@point_in_sph1)).to eq(false)
    end
  end

  describe "#volume" do
    it "returns volume of sphere" do
      expect(@sph2.volume.round(2)).to eq(33.51)
    end
  end

  describe "#surface_area" do
    it "returns surface_area of sphere" do
      expect(@sph2.surface_area.round(2)).to eq(50.27)
    end
  end

  describe "#equation" do
    it "returns equation for basic centered sphere" do
      expect(@sph1.equation).to eq("x^2 + y^2 + z^2 = 4")
    end
    it "returns equation for uncentered sphere" do
      expect(@sph2.equation).to eq("x^2 + (y - 3)^2 + (z + 5)^2 = 4")
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@sph1.help}.to output(/Sphere/).to_stdout
    end

    it "has class help method" do
      expect {Sphere.help}.to output(/Sphere/).to_stdout
    end

    it "maintains standard Ruby Sphere #methods" do
      expect(@sph1.methods).to include(:volume)
    end
  end
end
