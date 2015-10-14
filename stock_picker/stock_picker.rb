#!/usr/bin/ruby
def stock_picker(arr)
  max_profit_days=[]
  max_profit=0
  arr.each_with_index do |v,i|
    arr[i..arr.length].each_with_index do |j,k|
     # puts i.to_s + ' ' + j.to_s
     if max_profit < j-v 
       max_profit = j-v
       max_profit_days=[arr.index(v),arr.index(j)]
     end
    end
  end
  max_profit_days
end

stock_picker([7,3,6,9,15,8,6,1,10])
