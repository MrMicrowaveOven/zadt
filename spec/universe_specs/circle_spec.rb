require_relative '../spec_helper.rb'

describe Circle do
  before :each do
    @circle1 = Circle.new(2)
    @point_on_circle1 = Point.new([0,2])
    @point_not_on_circle1 = Point.new([1,2])
    @point_in_circle1 = Point.new([1,1])
    @point_not_in_circle1 = Point.new([1,3])

    @circle2 = Circle.new(2, [0,3])
    @point_one_away_from_circle2 = Point.new([-3, 3])
    @point_two_outside_of_circle2 = Point.new([0, -1])
  end

  describe "#area" do
    it "returns area of circle" do
      expect(@circle1.area.round(2)).to eq(12.57)
    end
  end

  describe "#circumference" do
    it "returns circumference of sphere" do
      expect(@circle1.circumference.round(2)).to eq(12.57)
    end
  end

  describe "#equation" do
    it "returns equation for basic centered circle" do
      expect(@circle1.equation).to eq("x^2 + y^2 = 4")
    end
    it "returns equation for uncentered circle" do
      expect(@circle2.equation).to eq("x^2 + (y - 3)^2 = 4")
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@circle1.help}.to output(/Circle/).to_stdout
    end

    it "has class help method" do
      expect {Circle.help}.to output(/Circle/).to_stdout
    end

    it "maintains standard Ruby Sphere #methods" do
      expect(@circle1.methods).to include(:area)
    end
  end
end
