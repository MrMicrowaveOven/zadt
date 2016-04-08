# zadt

Zagorski ADT is a collection of data types that are not included in the standard Ruby library.

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

zadt::ADT::help will return a list of objects in the collection, as well as a brief description of each type.

I also made a "help" function for each Data Type.  Type zadt::StackQueue.help get a list of functions for the StackQueue, and so on.

And don't forget to require 'zadt' at the top!

### MinMaxStackQueue

A MinMaxStackQueue is an Queue object that allows the minimum and maximum values to be found in constant time.  It's built by making a Queue out of a Stack, which has that same min/max ability.

Since it is made out of Queues and Stacks, those data types are also available.  I also provided StackQueue (functionally the same as a Queue), and a MinMaxStack, which is a Stack version of MinMaxStackQueue.

### Graph

A Graph is a data type that consists of Vertices, which are connected by Edges.  In addition, a FaceGraph is a Graph which also consists of Faces: the space defined inside a set of cyclic edges.

I'm still working on the exact functionality of FaceGraph, since I mainly built it to use for a different project, but it should still prove useful for certain situations.  If you have any suggestions of useful bits to add, feel free to contact me below!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org]("https://rubygems.org").

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zadt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact

This gem was written in its entirety by Benjamin Zagorski, who can be contacted at Benj@Zagorski.com.  Feel free to contact me with any questions or comments, as I'm very open to suggestions.
