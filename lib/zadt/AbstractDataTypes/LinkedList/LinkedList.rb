module Zadt
  class LinkedListNode
    attr_accessor :val, :next
    def initialize(val = nil, next_ = nil)
      @val = val
      @next = next_
    end

    def help
      LinkedListNode.help
    end

    def self.help
      LinkedListNode.show_help_message
    end

    private

    def self.show_help_message
      Zadt::ADT::show_linkedlist_help_message
    end
  end
end
