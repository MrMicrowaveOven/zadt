module Zadt
  class Stack
    def initialize
      @values = Array.new
    end

    def self.help
      Zadt::ADT::show_stack_help_message
    end

    def help
      Stack.help
    end

    def show
      @values
    end

    def push(val)
      @values.push(val)
      @values
    end

    def pop
      @values.pop
    end

    def peek
      @values.last
    end

    def length
      @values.length
    end

    def empty?
      @values.empty?
    end
  end
end
