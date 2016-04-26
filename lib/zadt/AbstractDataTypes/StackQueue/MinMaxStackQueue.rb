# A MinMaxStackQueue is a queue that allows for Min and Max
# to be found in constant time, unlike a queue or
# array that generally takes linear time.  It does this
# because it's based on a MinMaxStack, which has this
# ability.
module Zadt
  class MinMaxStackQueue
    def initialize
      @in = MinMaxStack.new
      @out = MinMaxStack.new
    end

    def self.help
      Zadt::ADT::show_minmaxstackqueue_help_message
    end

    def help
      MinMaxStackQueue.help
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

    def peek
      if @out.empty?
        @in.length.times do
          @out.push(@in.pop)
        end
      end
      @out.peek
    end

    def min
      if @in.empty?
        @out.min
      elsif @out.empty?
        @in.min
      else
        [@in.min, @out.min].min
      end
    end

    def max
      if @in.empty?
        @out.max
      elsif @out.empty?
        @in.max
      else
        [@in.max, @out.max].max
      end
    end

    def length
      @in.length + @out.length
    end

    def empty?
      @in.empty? && @out.empty?
    end
  end
end
