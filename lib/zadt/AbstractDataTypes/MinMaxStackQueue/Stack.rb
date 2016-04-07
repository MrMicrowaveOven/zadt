module Zadt
  class Stack
    def initialize
      @values = Array.new
    end

    def self.help
      puts "Here are the functions for Stack:"
      puts "#show"
      puts "#push(value)"
      puts "#pop"
      puts "#length"
      puts "#empty?"
    end

    def self.methods
      self.help
    end

    def help
      Stack.help
    end

    def methods
      help
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

    def length
      @values.length
    end

    def empty?
      @values.empty?
    end
  end
end
