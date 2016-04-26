require_relative '../spec_helper.rb'

describe Zadt::Stack do
  before :each do
    @stack = Zadt::Stack.new
  end

  describe "#push" do
    before :each do
      @stack.push("BottomOfStack!")
    end

    it "adds an item to the stack" do
      expect(@stack.show).to eq(["BottomOfStack!"])
    end

    it "adds an item to the top of the stack" do
      @stack.push("TopOfStack!")
      expect(@stack.show).to eq(["BottomOfStack!", "TopOfStack!"])
    end
  end

  describe "#pop" do
    before :each do
      @stack.push("BottomOfStack!")
      @stack.push("TopOfStack!")
    end

    it "returns the top-most value of the stack" do
      expect(@stack.pop).to eq("TopOfStack!")
    end

    it "removes the top-most value of the stack" do
      expect(@stack.pop).to eq("TopOfStack!")
      expect(@stack.pop).to eq("BottomOfStack!")
    end
  end

  describe "#peek" do
    before :each do
      @stack.push("BottomOfStack!")
      @stack.push("TopOfStack!")
    end

    it "returns the top-most value of the stack" do
      expect(@stack.peek).to eq("TopOfStack!")
    end

    it "doesn't remove the top-most value of the stack" do
      expect(@stack.peek).to eq("TopOfStack!")
      expect(@stack.pop).to eq("TopOfStack!")
    end
  end

  describe "#length" do
    before :each do
      @stack.push("BottomOfStack!")
      @stack.push("TopOfStack!")
    end

    it "returns the length of the stack" do
      expect(@stack.length).to eq(2)
    end
  end
  describe "#empty" do
    before :each do
      @stack.push("BottomOfStack!")
    end

    it "returns false when stack has a value in it" do
      expect(@stack.empty?).to eq(false)
    end

    it "returns true when stack is empty" do
      @stack.pop
      expect(@stack.empty?).to eq(true)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@stack.help}.to output(/Stack/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::Stack.help}.to output(/Stack/).to_stdout
    end

    it "maintains standard Ruby Stack #methods" do
      expect(@stack.methods).to include(:push)
    end
  end
end
