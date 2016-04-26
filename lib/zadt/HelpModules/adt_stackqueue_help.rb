module Zadt
  class ADT
    def self.show_stack_help_message
      puts "Here are the functions for Stack:"
      puts "#show"
      puts "#push(value)"
      puts "#pop"
      puts "#peek"
      puts "#length"
      puts "#empty?"
    end

    def self.show_queue_help_message
      puts "Here are the functions for Queue:"
      puts "#show"
      puts "#enqueue(value)"
      puts "#dequeue"
      puts "#peek"
      puts "#length"
      puts "#empty?"
    end

    def self.show_stackqueue_help_message
      puts "Here are the functions for StackQueue:"
      puts "#show"
      puts "#enqueue(value)"
      puts "#dequeue"
      puts "#peek"
      puts "#length"
      puts "#empty?"
    end

    def self.show_minmaxstack_help_message
      puts "Here are the functions for MinMaxStack:"
      puts "#show"
      puts "#push(value)"
      puts "#pop"
      puts "#peek"
      puts "#min"
      puts "#max"
      puts "#length"
      puts "#empty?"
    end

    def self.show_minmaxstackqueue_help_message
      puts "Here are the functions for MinMaxStackQueue:"
      puts "#show"
      puts "#enqueue(value)"
      puts "#dequeue"
      puts "#peek"
      puts "#min"
      puts "#max"
      puts "#length"
      puts "#empty?"
    end
  end
end
