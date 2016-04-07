module Zadt
  class Edge
    attr_accessor :connection
    def initialize(v1, v2)
      @connection = [v1, v2]
    end
    
    def self.help
      puts "Edge has one method:"
      puts "#connection, which returns the vertices the edge connects"
    end

    def self.methods
      self.help
    end

    def help
      self.help
    end

    def methods
      help
    end

    def inspect
      @connection.to_s
    end
  end
end
