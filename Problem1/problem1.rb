#!/usr/bin/env ruby

puts (1...1000).inject(0) {|sum,n| sum+((n%3==0 || n%5==0)?n:0)}
