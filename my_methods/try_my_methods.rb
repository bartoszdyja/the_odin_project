#!/usr/bin/ruby
require_relative 'my_methods'
include Enumerable
[1,2,3].my_each {|x| p x+1}
[1,2,3].my_each_with_index {|x,i| p "#{x} #{i}"}
