require_relative "../../lib/zadt/AbstractDataTypes/LinkedList/DoublyLinkedList.rb"

describe Zadt::DoublyLinkedListNode do
  before :each do
    @nodeC = Zadt::DoublyLinkedListNode.new(3)
    @nodeB = Zadt::DoublyLinkedListNode.new(2, @nodeC)
    @nodeA = Zadt::DoublyLinkedListNode.new(1, @nodeB)
  end

  describe "#next" do
    it "points to the next link" do
      expect(@nodeA.next.val).to eq(2)
      expect(@nodeA.next.next.val).to eq(3)
    end
  end
  describe "#val" do
    it "contains node value" do
      expect(@nodeA.val).to eq(1)
      expect(@nodeC.val).to eq(3)
    end
    it "can be set with 'val='" do
      @nodeA.val = 7
      expect(@nodeA.val).to eq(7)
    end
  end
  describe "#prev" do
    it "points to the previous link" do
      expect(@nodeB.prev.val).to eq(1)
      expect(@nodeC.prev.val).to eq(2)
      expect(@nodeC.prev.prev.val).to eq(1)
    end
  end
  describe "#next=" do
    it "re-assigns the next node" do
      @nodeC.next = @nodeA
      expect(@nodeC.next.val).to eq(1)
    end
    it "re-assigns the next node's previous node" do
      @nodeC.next = @nodeA
      expect(@nodeA.prev.val).to eq(3)
    end
  end
  describe "#prev=" do
    it "re-assigns the prev node" do
      @nodeC.prev = @nodeA
      expect(@nodeC.prev.val).to eq(1)
    end
    it "re-assigns the prev node's next node" do
      @nodeC.prev = @nodeA
      expect(@nodeA.next.val).to eq(3)
    end
  end
  it "chains with nexts and prevs" do
    expect(@nodeA.next.prev.next).to eq(@nodeB)
  end
  
  describe "#help_methods" do
    it "has valid help method: #help" do
      expect {@nodeA.help}.to output(/next/).to_stdout
    end

    it "has class help method" do
      expect {Zadt::DoublyLinkedListNode.help}.to output(/val/).to_stdout
    end

    it "maintains standard Ruby DoublyLinkedListNode #methods" do
      expect(@nodeA.methods).to include(:prev)
    end
  end
end
