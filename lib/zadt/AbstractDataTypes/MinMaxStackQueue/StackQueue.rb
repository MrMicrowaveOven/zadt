# A StackQueue works just like a queue, but it's based on
# a Stack.  Functionality-wise, it's exactly the same
# as a queue.  I mainly made it as an exercise leading
# up to MinMaxStackQueue.
module Zadt
  class StackQueue
    def initialize
      @in = Stack.new
      @out = Stack.new
    end

    def self.help
      puts "Here are the functions for StackQueue:"
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
      StackQueue.help
    end

    def methods
      help
    end

    def show
      @out.show.reverse + @in.show
    end

    def enqueue(val)
      @in.push(val)
    end

    def dequeue
      if @out.empty?
        @in.length.times do
          @out.push(@in.pop)
        end
      end
      @out.pop
    end

    def length
      @in.length + @out.length
    end

    def empty?
      @values.empty?
    end
  end
end
