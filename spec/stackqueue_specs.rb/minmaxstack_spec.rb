require_relative '../spec_helper.rb'

describe Zadt::MinMaxStack do
  before :each do
    @minmaxstack = Zadt::MinMaxStack.new
  end

  describe "#push" do
    before :each do
      @minmaxstack.push("BottomOfStack!")
    end

    it "adds an item to the stack" do
      expect(@minmaxstack.show).to eq(["BottomOfStack!"])
    end

    it "adds an item to the top of the stack" do
      @minmaxstack.push("TopOfStack!")
      expect(@minmaxstack.show).to eq(["BottomOfStack!", "TopOfStack!"])
    end
  end

  describe "#pop" do
    before :each do
      @minmaxstack.push("BottomOfStack!")
      @minmaxstack.push("TopOfStack!")
    end

    it "returns the top-most value of the stack" do
      expect(@minmaxstack.pop).to eq("TopOfStack!")
    end

    it "removes the top-most value of the stack" do
      expect(@minmaxstack.pop).to eq("TopOfStack!")
      expect(@minmaxstack.pop).to eq("BottomOfStack!")
    end
  end

  describe "#peek" do
    before :each do
      @minmaxstack.push("BottomOfStack!")
      @minmaxstack.push("TopOfStack!")
    end

    it "returns the top-most value of the stack" do
      expect(@minmaxstack.peek).to eq("TopOfStack!")
    end

    it "doesn't remove the top-most value of the stack" do
      expect(@minmaxstack.peek).to eq("TopOfStack!")
      expect(@minmaxstack.pop).to eq("TopOfStack!")
    end
  end

  describe "#length" do
    before :each do
      @minmaxstack.push("BottomOfStack!")
      @minmaxstack.push("TopOfStack!")
    end

    it "returns the length of the stack" do
      expect(@minmaxstack.length).to eq(2)
    end
  end

  describe "#empty" do
    before :each do
      @minmaxstack.push("BottomOfStack!")
    end

    it "returns false when stack has a value in it" do
      expect(@minmaxstack.empty?).to eq(false)
    end

    it "returns true when stack is empty" do
      @minmaxstack.pop
      expect(@minmaxstack.empty?).to eq(true)
    end
  end

  describe "#minandmax" do
    before :each do
      @minmaxstack.push(3)
      @minmaxstack.push(7)
      @minmaxstack.push(2)
      @minmaxstack.push(4)
    end

    it "returns minimum of the stack" do
      expect(@minmaxstack.min).to eq(2)
    end
    it "returns maximum of the stack" do
      expect(@minmaxstack.max).to eq(7)
    end

    it "maintains minimum through regular operations" do
      @minmaxstack.pop
      @minmaxstack.pop
      expect(@minmaxstack.min).to eq(3)
    end
    it "maintains maximum through regular operations" do
      @minmaxstack.pop
      @minmaxstack.pop
      expect(@minmaxstack.max).to eq(7)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@minmaxstack.help}.to output(/MinMaxStack/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::MinMaxStack.help}.to output(/MinMaxStack/).to_stdout
    end

    it "maintains standard Ruby MinMaxStack #methods" do
      expect(@minmaxstack.methods).to include(:push)
    end
  end
end
