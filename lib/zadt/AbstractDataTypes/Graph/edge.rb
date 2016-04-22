  class Edge
    # Made up of a
    attr_reader :connection
    # Contains
    attr_accessor :value
    def initialize(v1, v2, value = Hash.new)
      @connection = [v1, v2]
      @value = value
    end

    def inspect
      @connection.to_s
    end

  end
