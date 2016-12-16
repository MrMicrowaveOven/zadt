describe Zadt::SinglyLinkedList do
  before :each do
    @singlylinkedlistC = Zadt::SinglyLinkedList.new(3)
    @singlylinkedlistB = Zadt::SinglyLinkedList.new(2, @singlylinkedlistC)
    @singlylinkedlistA = Zadt::SinglyLinkedList.new(1, @singlylinkedlistB)
  end

  describe "#next" do
    it "points to the next link" do
      expect(@singlylinkedlistA.next.value).to eq(2)
      expect(@singlylinkedlistA.next.next.value).to eq(3)
    end
  end
end
