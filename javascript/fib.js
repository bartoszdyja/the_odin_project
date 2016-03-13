function fib(n) {
  if(n==0)
    return 0;
  else if(n==1)
    return 1;
  else
    return fib(n-2)+fib(n-1);
}
var total=0;
var i=0;
do {
  nth=fib(i);
  if(nth%2==0){total+=nth;}
  i++;
}
while(nth<4000000);
console.log(total);
