require_relative "../spec_helper.rb"

describe Point do
  RSpec::Expectations.configuration.on_potential_false_positives = :nothing
  before :each do
    @pointA = Point.new([5,4,3])
  end
  it "stores coordinates" do
    expect(@pointA.coords).to eq([5,4,3])
  end
  it "stores the dimensions of the coordinates" do
    expect(@pointA.dims).to eq(3)
  end
  it "is immutable" do
    expect{@pointA.coords=[0,0]}.to raise_error
    expect{@pointA.dims=4}.to raise_error
  end
  it "doesn't have default coordinates" do
    expect{@pointB = Point.new}.to raise_error
  end
  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@pointA.help}.to output(/Point/).to_stdout
    end

    it "has class help method" do
      expect {Point.help}.to output(/Point/).to_stdout
    end

    it "maintains standard Ruby Point #methods" do
      expect(@pointA.methods).to include(:coords)
    end
  end
end
