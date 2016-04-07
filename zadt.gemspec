# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zadt/version'

Gem::Specification.new do |spec|
  spec.name          = "zadt"
  spec.version       = Zadt::VERSION
  spec.authors       = ["Benjamin Zagorski"]
  spec.email         = ["benj@zagorski.com"]

  spec.summary       = %q{Zagorski ADT is a collection of advanced data types that are not included in the standard Ruby library.}
  spec.description   = %q{Includes two different categories of Advanced Data Types: Array-Based, and Graphs.
    Array-Based Data Types include Stack, Queue, StackQueue, MinMaxStack, and MinMaxStackQueue.
    Graph Data Types include Graph, Vertex, Edge, FaceGraph, and Face.
    Once installed, type "Zadt::ADT::help" for a list of datatypes
    and basic functionality.}
  spec.homepage      = "https://github.com/MrMicrowaveOven/zadt.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
