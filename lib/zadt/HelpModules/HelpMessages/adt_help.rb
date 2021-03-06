module Zadt
  class ADT
    def self.help
      puts "Thank you for using Zagorski Abstract Data Types!"
      puts "This package contains the following Data Types:"

      puts "Array-Like Data Types"
      puts "-Stack, a LIFO array with functions push and pop"
      puts "-Queue, a FIFO array with functions enqueue and dequeue"
      puts "-StackQueue, a Queue that is Stack-based (no real difference)"
      puts "-MinMaxStack, a Stack that can return Min and Max in constant time"
      puts "-MinMaxStackQueue, a Queue that can return Min and Max in constant time"

      puts "Graph Data Types"
      puts "-Graph, consisting of Vertices connected by Edges"
      puts "--Vertex, a 'spot' on the graph"
      puts "--Edge, connects two vertices"
      puts "-FaceGraph, a sub-class of Graph which includes Faces"
      puts "--Face, a space surrounded by a cycle of Edges.  Consists of Vertices and the Edges connecting them"

      puts "Linked Lists"
      puts "-LinkedListNode, an object containing a value (val), and a pointer to the next link (next)."
      puts "-DoublyLinkedListNode, an object containing a value (val), a pointer to the next link (next), and a pointer to the previous link (prev)."


      puts "Geometrics"
      puts "-Universe, consisting of Points and Spheres"
      puts "--Point, a 'spot' in the universe"
      puts "--Sphere, a set of points in a certain number of dimensions that is equidistant from a given point, called the Center"

      puts ""
      puts "Each data type also has a help function.  Type Zadt::Stack::help for a list of Stack methods, and so on for each data type."
    end
  end
end
