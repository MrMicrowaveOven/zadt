require_relative '../spec_helper.rb'

describe Zadt::Enum do
  describe "initialize" do
    it "sets the enumeration" do
      @enum = Zadt::Enum.new(["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"])
      expect(@enum.values).to eq(["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"])
    end
  end
  describe "[]" do
    before :each do
      @enum = Zadt::Enum.new(["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"])
    end
    it "gives the index of the given element" do
      expect(@enum["Mon"]).to eq(1)
      expect(@enum["Thurs"]).to eq(4)
    end
  end
end
