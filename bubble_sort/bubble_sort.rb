#!/usr/bin/ruby

def bubble_sort_by(unsorted)
  swapped=true
  while swapped do
    swapped=false
    1.upto unsorted.length-1  do |i|
        if yield(unsorted[i-1],unsorted[i]) > 0
          unsorted[i-1],unsorted[i] = unsorted[i], unsorted[i-1]
          swapped=true
        end
    end
  end
  return unsorted
end

def bubble_sort(unsorted)
  sort_array=bubble_sort_by(unsorted) {|a,b| a <=> b} 
  p sort_array
end

bubble_sort [6,5,4,3,2,1]        
