module Zadt
  class SinglyLinkedListNode
    attr_accessor :val, :next
    def initialize(val = nil, next_ = nil)
      @val = val
      @next = next_
    end
  end
end
