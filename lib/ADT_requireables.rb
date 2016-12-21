# Note that we only require those that are included in the gem, not their dependancies.
# This is so the client does not have access to these private classes
# Ex. A client cannot make an edge other than within a graph.

require_relative 'zadt/HelpModules/adt_help.rb'
require_relative 'zadt/HelpModules/adt_stackqueue_help.rb'
require_relative 'zadt/HelpModules/adt_graph_help.rb'
require_relative 'zadt/HelpModules/adt_geometrics_help.rb'

require_relative 'zadt/AbstractDataTypes/StackQueue/Stack.rb'
require_relative 'zadt/AbstractDataTypes/StackQueue/Queue.rb'
require_relative 'zadt/AbstractDataTypes/StackQueue/StackQueue.rb'
require_relative 'zadt/AbstractDataTypes/StackQueue/MinMaxStack.rb'
require_relative 'zadt/AbstractDataTypes/StackQueue/MinMaxStackQueue.rb'

require_relative 'zadt/AbstractDataTypes/Graph/graph.rb'
require_relative 'zadt/AbstractDataTypes/Graph/face.rb'
require_relative 'zadt/AbstractDataTypes/Graph/face_graph.rb'

require_relative 'zadt/AbstractDataTypes/Geometrics/universe.rb'

require_relative 'zadt/AbstractDataTypes/LinkedList/LinkedList.rb'
require_relative 'zadt/AbstractDataTypes/LinkedList/DoublyLinkedList.rb'
