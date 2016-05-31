# zadt

Zagorski ADT is a collection of abstract data types that are not included in the standard Ruby library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zadt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zadt

## Usage

Zadt::ADT::help will return a list of objects in the collection, as well as a brief description of each type.

I also made a "help" function for each Data Type.  Type Zadt::StackQueue.help get a list of methods for the StackQueue, and so on.

And don't forget to require 'zadt' at the top!

### Stacks and Queues

If you've never heard of a Stack or a Queue before, click [here](https://en.wikibooks.org/wiki/Data_Structures/Stacks_and_Queues) for an introduction.

A MinMaxStackQueue is an Queue object that allows the minimum and maximum values to be found in constant time.  It's built by making a Queue out of a Stack, which has that same min/max ability.

Since it is made out of Queues and Stacks, those data types are also available.  I also provided StackQueue (functionally the same as a Queue), and a MinMaxStack, which is a Stack version of MinMaxStackQueue.

#### Stack

My Stack has the following methods:
* show, returns the entire stack
* push(value), adds a value to the top of the stack
* pop, returns the value at the top of the stack, and removes it
* peek, returns the value at the top of the stack, but doesn't remove it
* length, number of values in the stack
* empty?, whether or not the stack is empty

#### Queue

My Queue has the following methods:
* show, returns the entire queue
* enqueue(value), adds a value to the back of the queue
* dequeue, returns the value at the front of the queue, and removes it
* peek, returns the value at the front of the queue, but doesn't remove it
* length, number of values in the queue
* empty?, whether or not the queue is empty

#### StackQueue

StackQueue has the same methodology as Queue

#### MinMaxStack

My MinMaxStack has the following methods:
* show, returns the entire stack
* push(value), adds a value to the top of the stack
* pop, returns the value at the top of the stack, and removes it
* peek, returns the value at the top of the stack, but doesn't remove it
* min, returns the lowest value of the stack.  Works in constant time.
* max, returns the highest value of the stack.  Works in constant time.
* length, number of values in the stack
* empty?, whether or not the stack is empty

#### MinMaxStackQueue

My MinMaxStackQueue has the following methods:
* show, returns the entire queue
* enqueue(value), adds a value to the back of the queue
* dequeue, returns the value at the front of the queue, and removes it
* peek, returns the value at the front of the queue, but doesn't remove it
* min, returns the lowest value of the queue.  Works in constant time.
* max, returns the highest value of the queue.  Works in constant time.
* length, number of values in the queue
* empty?, whether or not the queue is empty

### Graph Objects

A Graph is a data type that consists of Vertices, which are connected by Edges.  In addition, a FaceGraph is a Graph which also consists of Faces: the space defined inside a set of cyclic edges.

I'm still working on the exact functionality of FaceGraph, since I mainly built it to use for a different project, but it should still prove useful for certain situations.  If you have any suggestions of useful bits to add, feel free to contact me!

Below are the specifics of such data types.

#### Graph

A Graph has the following methods
* add_vertex, adds a vertex to your graph
* remove_vertex(vertex), removes the given vertex from the graph (vertex must not be connected)
* make_connection(v1,v2), adds an edge between two vertices
* break_connection(v1,v2), removes an edge between two vertices
* find_connection(v1,v2), returns edge connecting two given vertices
* is_connected?(v1,v2), returns true if the two vertices are connected with an edge, false otherwise

#### FaceGraph

A FaceGraph has the following methods, in addition to its inheritance from Graph
* add_face(edges_array), makes a face with the given edges (must be cyclicly connected)
* make_original_face(num_edges), which makes a standard disconnected face
* add_attached_face(vertex_array, num_edges), which adds a face connected to the vertex_array specified.  Face will consist of the number of edges specified.
* find_neighbors(vertex_array), lists all faces containing the given vertices
* find_face_neighbors(face), which finds all neighbors of the given face.  A neighbor of a face is defined as one that shares a vertex (not necessarily an edge)

### Geometrics

Geometric objects, contained within a universe.

#### Universe

An universe is a Euclidean coordinate system that can be any number of dimensions.  When initialized, you can specify how many dimensions you want it, or you can leave it blank to have infinite dimensions.  Once a dimension is set, all objects in it are limited to that many dimensions.  A universe of infinite dimensions has no restrictions, and can hold objects of any number of dimensions.

Within the universe, you can create Points and Spheres (though the more proper term is HyperSphere, more on that later).  The only two functions are #add_point(coordinates) and #add_sphere(radius, center).  Both will check to ensure that the number of dimensions matches the universe (if the universe has a finite number of dimensions).

In addition, the universe has the class method Universe.distance(pointA, pointB), which will tell you the distance between any two points.  This will work for points in any number of dimensions, so long as the two points are of the same.

#### HyperSphere

A HyperSphere is a set of points within a certain number of dimensions that are equidistant (equal distance) from a given point.  The number of dimensions is defined by the number of coordinates in its center.  For example, a two-dimensional sphere (called a Circle) has a center of (x,y).

Upon creation, a HyperSphere is given a radius and a center (default is the 4-dimensional Unit Sphere, of radius 1 and center [0,0,0,0]).  HyperSpheres are immutable.

A HyperSphere has the following methods
* on?(point) will return if a point is on the HyperSphere.
* inside?(point) will return if a point is within the boundaries of the HyperSphere.
* outside?(point) will return if a point is outside the boundaries of the HyperSphere.
* how_far(point) will return how far a point is from the boundaries of the HyperSphere.

##### Sphere

A Sphere is a sub-class of the HyperSphere that has 3 dimensions and the following additional methods.
* volume, returns the volume of the sphere
* surface_area, returns the surface area of the sphere
* equation, returns a string of the standard equation of the sphere.  For example, a sphere with Radius 2 and Center [0,1,-2] will return "x^2 + (y - 1)^2 + (z + 2)^2 = 4".

##### Circle

A Circle is a sub-class of the HyperSphere that has 2 dimensions and the following additional methods.
* area, returns the area of the sphere
* circumference, returns the circumference of the sphere
* equation, returns a string of the standard equation of the sphere.  For example, a sphere with Radius 2 and Center [0,1] will return "x^2 + (y - 1)^2 = 4".
<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org]("https://rubygems.org"). -->
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrmicrowaveoven/zadt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact

This gem was written in its entirety by Benjamin Zagorski, who can be contacted at Benj@Zagorski.com.  My portfolio can be found at [BenjZagorski.online](http://benjzagorski.online).  Feel free to contact me with any questions or comments, as I'm very open to suggestions.
