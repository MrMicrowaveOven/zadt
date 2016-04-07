module Zadt
  class Edge
    attr_accessor :connection
    def initialize(v1, v2)
      @connection = [v1, v2]
    end
    def inspect
      @connection.to_s
    end
  end
end
