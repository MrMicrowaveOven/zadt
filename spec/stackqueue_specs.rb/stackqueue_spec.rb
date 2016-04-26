require_relative '../spec_helper.rb'

describe Zadt::StackQueue do
  before :each do
    @stackqueue = Zadt::StackQueue.new
  end

  describe "#enqueue" do
    before :each do
      @stackqueue.enqueue("FrontOfStackQueue!")
    end

    it "adds an item to the queue" do
      expect(@stackqueue.show).to eq(["FrontOfStackQueue!"])
    end

    it "adds an item to the back of the queue" do
      @stackqueue.enqueue("BackOfStackQueue!")
      expect(@stackqueue.show).to eq(["FrontOfStackQueue!", "BackOfStackQueue!"])
    end
  end

  describe "#dequeue" do
    before :each do
      @stackqueue.enqueue("FrontOfStackQueue!")
      @stackqueue.enqueue("BackOfStackQueue!")
    end

    it "returns the front value of the queue" do
      expect(@stackqueue.dequeue).to eq("FrontOfStackQueue!")
    end

    it "removes the front value of the queue" do
      expect(@stackqueue.dequeue).to eq("FrontOfStackQueue!")
      expect(@stackqueue.dequeue).to eq("BackOfStackQueue!")
    end
  end

  describe "#peek" do
    before :each do
      @stackqueue.enqueue("FrontOfStackQueue!")
      @stackqueue.enqueue("BackOfStackQueue!")
    end

    it "returns the front value of the queue" do
      expect(@stackqueue.peek).to eq("FrontOfStackQueue!")
    end

    it "doesn't remove the top-most value of the queue" do
      expect(@stackqueue.peek).to eq("FrontOfStackQueue!")
      expect(@stackqueue.dequeue).to eq("FrontOfStackQueue!")
    end
  end

  describe "#length" do
    before :each do
      @stackqueue.enqueue("FrontOfStackQueue!")
      @stackqueue.enqueue("BackOfStackQueue!")
    end

    it "returns the length of the queue" do
      expect(@stackqueue.length).to eq(2)
    end
  end
  describe "#empty" do
    before :each do
      @stackqueue.enqueue("FrontOfStackQueue!")
    end

    it "returns false when queue has a value in it" do
      expect(@stackqueue.empty?).to eq(false)
    end

    it "returns true when queue is empty" do
      @stackqueue.dequeue
      expect(@stackqueue.empty?).to eq(true)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@stackqueue.help}.to output(/StackQueue/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::StackQueue.help}.to output(/StackQueue/).to_stdout
    end

    it "maintains standard Ruby stackqueue #methods" do
      expect(@stackqueue.methods).to include(:enqueue)
    end
  end
end
