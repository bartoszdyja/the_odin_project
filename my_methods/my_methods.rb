module Enumerable
  def my_each
    if block_given?
      for val in self
        yield val
      end
    end
  end

  def my_each_with_index
    if block_given?
      i=0
      for val in self
        yield(val, i)
        i+=1
      end
    end
  end
end
