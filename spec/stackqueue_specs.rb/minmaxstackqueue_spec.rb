require_relative '../spec_helper.rb'

describe Zadt::MinMaxStackQueue do
  before :each do
    @minmaxstackqueue = Zadt::MinMaxStackQueue.new
  end

  describe "#enqueue" do
    before :each do
      @minmaxstackqueue.enqueue("FrontOfQueue!")
    end

    it "adds an item to the queue" do
      expect(@minmaxstackqueue.show).to eq(["FrontOfQueue!"])
    end

    it "adds an item to the back of the queue" do
      @minmaxstackqueue.enqueue("BackOfQueue!")
      expect(@minmaxstackqueue.show).to eq(["FrontOfQueue!", "BackOfQueue!"])
    end
  end

  describe "#dequeue" do
    before :each do
      @minmaxstackqueue.enqueue("FrontOfQueue!")
      @minmaxstackqueue.enqueue("BackOfQueue!")
    end

    it "returns the front value of the queue" do
      expect(@minmaxstackqueue.dequeue).to eq("FrontOfQueue!")
    end

    it "removes the front value of the queue" do
      expect(@minmaxstackqueue.dequeue).to eq("FrontOfQueue!")
      expect(@minmaxstackqueue.dequeue).to eq("BackOfQueue!")
    end
  end

  describe "#peek" do
    before :each do
      @minmaxstackqueue.enqueue("FrontOfQueue!")
      @minmaxstackqueue.enqueue("BackOfQueue!")
    end

    it "returns the front value of the queue" do
      expect(@minmaxstackqueue.peek).to eq("FrontOfQueue!")
    end

    it "doesn't remove the top-most value of the queue" do
      expect(@minmaxstackqueue.peek).to eq("FrontOfQueue!")
      expect(@minmaxstackqueue.dequeue).to eq("FrontOfQueue!")
    end
  end

  describe "#length" do
    before :each do
      @minmaxstackqueue.enqueue("FrontOfQueue!")
      @minmaxstackqueue.enqueue("BackOfQueue!")
    end

    it "returns the length of the queue" do
      expect(@minmaxstackqueue.length).to eq(2)
    end
  end
  describe "#empty" do
    before :each do
      @minmaxstackqueue.enqueue("FrontOfQueue!")
    end

    it "returns false when queue has a value in it" do
      expect(@minmaxstackqueue.empty?).to eq(false)
    end

    it "returns true when queue is empty" do
      @minmaxstackqueue.dequeue
      expect(@minmaxstackqueue.empty?).to eq(true)
    end
  end

  describe "#minandmax" do
    before :each do
      @minmaxstackqueue.enqueue(3)
      @minmaxstackqueue.enqueue(7)
      @minmaxstackqueue.enqueue(2)
      @minmaxstackqueue.enqueue(4)
    end

    it "returns minimum of the queue" do
      expect(@minmaxstackqueue.min).to eq(2)
    end
    it "returns maximum of the queue" do
      expect(@minmaxstackqueue.max).to eq(7)
    end

    it "maintains minimum through regular operations" do
      @minmaxstackqueue.dequeue
      @minmaxstackqueue.dequeue
      expect(@minmaxstackqueue.min).to eq(2)
    end
    it "maintains maximum through regular operations" do
      @minmaxstackqueue.dequeue
      @minmaxstackqueue.dequeue
      expect(@minmaxstackqueue.max).to eq(4)
    end
  end

  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@minmaxstackqueue.help}.to output(/MinMaxStackQueue/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::MinMaxStackQueue.help}.to output(/MinMaxStackQueue/).to_stdout
    end

    it "maintains standard Ruby queue #methods" do
      expect(@minmaxstackqueue.methods).to include(:enqueue)
    end
  end
end
