require_relative "../../lib/zadt/AbstractDataTypes/LinkedList/SinglyLinkedList.rb"

describe Zadt::SinglyLinkedListNode do
  before :each do
    @nodeC = Zadt::SinglyLinkedListNode.new(3)
    @nodeB = Zadt::SinglyLinkedListNode.new(2, @nodeC)
    @nodeA = Zadt::SinglyLinkedListNode.new(1, @nodeB)
  end

  describe "#next" do
    it "points to the next link" do
      expect(@nodeA.next.val).to eq(2)
      expect(@nodeA.next.next.val).to eq(3)
    end
    it "can be set with 'next='" do
      @nodeA.next = @nodeC
      expect(@nodeA.next).to eq(@nodeC)
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
end