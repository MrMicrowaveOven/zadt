module Zadt
  class DoublyLinkedListNode
    attr_accessor :val
    attr_reader :next, :prev
    def initialize(val = nil, next_ = nil)
      @val = val
      if !next_
        @next = next_
      else
        self.next = next_
      end
      @prev = nil
    end

    def next=(node)
      @next = node
      node.prev = self
    end

    def prev=(node)
      @prev = node
      node.next = self if node.next != self
    end
    
    def help
      LinkedListNode.help
    end

    def self.help
      LinkedListNode.show_help_message
    end

    private

    def self.show_help_message
      Zadt::ADT::show_linkedlistnode_help_message
    end

  end
end
