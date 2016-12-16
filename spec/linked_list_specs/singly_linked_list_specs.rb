describe Zadt::SinglyLinkedListNode do
  before :each do
    @singlylinkedlistC = Zadt::SinglyLinkedListNode.new(3)
    @singlylinkedlistB = Zadt::SinglyLinkedListNode.new(2, @singlylinkedlistC)
    @singlylinkedlistA = Zadt::SinglyLinkedListNode.new(1, @singlylinkedlistB)
  end

  describe "#next" do
    it "points to the next link" do
      expect(@singlylinkedlistA.next.value).to eq(2)
      expect(@singlylinkedlistA.next.next.value).to eq(3)
    end
  end
end
