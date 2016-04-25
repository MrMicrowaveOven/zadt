# Note that we only require those that are included in the gem, not their dependancies.
# This is so the client does not have access to these private classes
# Ex. A client cannot make an edge other than in a graph.

require_relative 'zadt/AbstractDataTypes/ADT.rb'
require_relative 'zadt/AbstractDataTypes/MinMaxStackQueue/Stack.rb'
require_relative 'zadt/AbstractDataTypes/MinMaxStackQueue/Queue.rb'
require_relative 'zadt/AbstractDataTypes/MinMaxStackQueue/StackQueue.rb'
require_relative 'zadt/AbstractDataTypes/MinMaxStackQueue/MinMaxStack.rb'
require_relative 'zadt/AbstractDataTypes/MinMaxStackQueue/MinMaxStackQueue.rb'

require_relative 'zadt/AbstractDataTypes/Graph/graph.rb'
require_relative 'zadt/AbstractDataTypes/Graph/face.rb'
require_relative 'zadt/AbstractDataTypes/Graph/face_graph.rb'

require_relative 'zadt/AbstractDataTypes/Geometrics/universe.rb'
