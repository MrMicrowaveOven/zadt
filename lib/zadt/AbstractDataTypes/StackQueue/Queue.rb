module Zadt
  class Queue
    def initialize
      @values = Array.new
    end

    def self.help
      Zadt::ADT::show_queue_help_message
    end

    def help
      Queue.help
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

    def peek
      @values.first
    end

    def length
      @values.length
    end

    def empty?
      @values.empty?
    end
  end
end
