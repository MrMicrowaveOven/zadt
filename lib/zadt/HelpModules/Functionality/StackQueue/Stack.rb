module Zadt
  class Stack
    def self.help
      Zadt::ADT::show_stack_help_message
    end

    def help
      Stack.help
    end
  end
end
