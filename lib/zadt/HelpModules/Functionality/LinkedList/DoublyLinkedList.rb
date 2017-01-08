module Zadt
  class DoublyLinkedListNode
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
