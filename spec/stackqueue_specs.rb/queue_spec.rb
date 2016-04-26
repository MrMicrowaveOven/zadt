require_relative '../spec_helper.rb'

describe Zadt::Queue do
  before :each do
    @queue = Zadt::Queue.new
  end

  describe "#enqueue" do
    before :each do
      @queue.enqueue("FrontOfQueue!")
    end

    it "adds an item to the queue" do
      expect(@queue.show).to eq(["FrontOfQueue!"])
    end

    it "adds an item to the back of the queue" do
      @queue.enqueue("BackOfQueue!")
      expect(@queue.show).to eq(["FrontOfQueue!", "BackOfQueue!"])
    end
  end

  describe "#dequeue" do
    before :each do
      @queue.enqueue("FrontOfQueue!")
      @queue.enqueue("BackOfQueue!")
    end

    it "returns the front value of the queue" do
      expect(@queue.dequeue).to eq("FrontOfQueue!")
    end

    it "removes the front value of the queue" do
      expect(@queue.dequeue).to eq("FrontOfQueue!")
      expect(@queue.dequeue).to eq("BackOfQueue!")
    end
  end

  describe "#peek" do
    before :each do
      @queue.enqueue("FrontOfQueue!")
      @queue.enqueue("BackOfQueue!")
    end

    it "returns the front value of the queue" do
      expect(@queue.peek).to eq("FrontOfQueue!")
    end

    it "doesn't remove the top-most value of the queue" do
      expect(@queue.peek).to eq("FrontOfQueue!")
      expect(@queue.dequeue).to eq("FrontOfQueue!")
    end
  end

  describe "#length" do
    before :each do
      @queue.enqueue("FrontOfQueue!")
      @queue.enqueue("BackOfQueue!")
    end

    it "returns the length of the queue" do
      expect(@queue.length).to eq(2)
    end
  end
  describe "#empty" do
    before :each do
      @queue.enqueue("FrontOfQueue!")
    end

    it "returns false when queue has a value in it" do
      expect(@queue.empty?).to eq(false)
    end

    it "returns true when queue is empty" do
      @queue.dequeue
      expect(@queue.empty?).to eq(true)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@queue.help}.to output(/Queue/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::Queue.help}.to output(/Queue/).to_stdout
    end

    it "maintains standard Ruby queue #methods" do
      expect(@queue.methods).to include(:enqueue)
    end
  end
end
