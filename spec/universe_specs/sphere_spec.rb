require_relative '../spec_helper.rb'

describe Sphere do
  before :each do
    @sph1 = Sphere.new(2)
    @point_on_sph1 = Point.new([0,2,0])
    @point_not_on_sph1 = Point.new([1,2,0])
    @point_in_sph1 = Point.new([1,1,0])
    @point_not_in_sph1 = Point.new([1,3,0])

    @sph2 = Sphere.new(2, [0,3,-5])
    @point_one_away_from_sph2 = Point.new([0,2,-5])
    @point_two_outside_of_sph2 = Point.new([-4,3,-5])

    @sph4d = Sphere.new(3, [0,0,0,2])
  end

  describe "#on_sphere?" do
    it "returns true for a simple point on the sphere" do
      expect(@sph1.on_sphere?(@point_on_sph1)).to eq(true)
    end
    it "returns false for a simple point not on the sphere" do
      expect(@sph1.on_sphere?(@point_not_on_sph1)).to eq(false)
    end
  end

  describe "#how_far_from_sphere" do
    it "returns zero when a point is on the sphere" do
      expect(@sph1.how_far_from_sphere(@point_on_sph1)).to eq(0)
    end
    it "gives distance from sphere (inside)" do
      expect(@sph2.how_far_from_sphere(@point_one_away_from_sph2)).to eq(1)
    end
    it "gives distance from sphere (outside)" do
      expect(@sph2.how_far_from_sphere(@point_two_outside_of_sph2)).to eq(2)
    end
  end

  describe "#in_sphere?" do
    it "returns true for a simple point in the sphere" do
      expect(@sph1.in_sphere?(@point_in_sph1)).to eq(true)
    end
    it "returns false for a simple point not in the sphere" do
      expect(@sph1.in_sphere?(@point_not_in_sph1)).to eq(false)
    end
  end

  describe "#out_of_sphere?" do
    it "returns true for a simple point out of the sphere" do
      expect(@sph1.out_of_sphere?(@point_not_in_sph1)).to eq(true)
    end
    it "returns false for a simple point in the sphere" do
      expect(@sph1.out_of_sphere?(@point_in_sph1)).to eq(false)
    end
  end

  describe "#volume" do
    it "returns volume of sphere" do
      expect(@sph2.volume.round(2)).to eq(33.51)
    end
    it "raises error if not 3d sphere" do
      expect{@sph4d.volume}.to raise_error("dimension error")
    end
  end

  describe "#surface_area" do
    it "returns surface_area of sphere" do
      expect(@sph2.surface_area.round(2)).to eq(50.27)
    end
    it "raises error if not 3d sphere" do
      expect{@sph4d.surface_area}.to raise_error("dimension error")
    end
  end

  describe "#equation" do
    it "returns equation for basic centered sphere" do
      expect(@sph1.equation).to eq("x^2 + y^2 + z^2 = 4")
    end
    it "returns equation for uncentered sphere" do
      expect(@sph2.equation).to eq("x^2 + (y - 3)^2 + (z + 5)^2 = 4")
    end
    it "raises error if not 3d sphere" do
      expect{@sph4d.equation}.to raise_error("dimension error")
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
