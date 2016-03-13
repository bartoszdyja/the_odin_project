def fib(n)
  return 0 if n==0
  arr=[0,1]
  (n-2).times do
    arr << arr[-1] + arr[-2]
  end
  arr
end

def fib_rec(n)
  if n>1 then
    a=fib_rec(n-1) +fib_rec(n-2)
    print a
  else
    n
  end
end

print fib(20)
puts
print fib_rec(20)
