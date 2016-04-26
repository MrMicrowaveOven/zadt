# A MinMaxStack is a stack that allows for Min and Max
# to be found in constant time, unlike a stack or
# array that generally takes linear time.
module Zadt
  class MinMaxStack
    def initialize
      @values = []
    end

    def self.help
      Zadt::ADT::show_minmaxstack_help_message
    end

    def help
      MinMaxStack.help
    end

    def push(val)
      if @values.empty?
        @values.push([val, val, val])
      else
        cur_min = @values.last[1]
        cur_max = @values.last[2]
        @values.push([val, [val, cur_min].min, [val, cur_max].max])
        @values
      end
    end

    def pop
      @values.pop[0]
    end

    def peek
      @values.last[0]
    end

    def min
      @values.empty? ? "Empty" : @values.last[1]
    end

    def max
      @values.empty? ? "Empty" : @values.last[2]
    end

    def length
      @values.length
    end

    def show
      showthis = []
      @values.map{|value| value[0]}
    end

    def empty?
      @values.empty?
    end
  end
end
