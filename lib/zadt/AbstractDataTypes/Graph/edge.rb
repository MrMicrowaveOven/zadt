module Zadt
  class Edge
    # Made up of a
    attr_reader :connection
    # Contains
    attr_accessor :value
    def initialize(v1, v2, value = Hash.new)
      @connection = [v1, v2]
      @value = value
    end

    def self.methods
      self.help
    end


    def inspect
      @connection.to_s
    end

    def help
      self.help
    end

    def methods
      help
    end

    def self.help
      puts "Edge has one method:"
      puts "#connection, which returns the vertices the edge connects"
    end

    private

  end
end
