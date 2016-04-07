module Zadt
  class Queue
    def initialize
      @values = Array.new
    end

    def self.help
      puts "Here are the functions for Queue:"
      puts "#show"
      puts "#enqueue(value)"
      puts "#dequeue"
      puts "#length"
      puts "#empty?"
    end

    def self.methods
      self.help
    end

    def help
      Queue.help
    end

    def methods
      help
    end

    def show
      @values
    end

    def enqueue(val)
      @values.push(val)
      @values
    end

    def dequeue
      @values.shift
    end

    def length
      @values.length
    end

    def empty?
      @values.empty?
    end
  end
end
