var given_number=30;
var factor=2;
var max_factor;

while(factor <= given_number){
  if ( given_number%factor==0 ) {
    given_number /= factor;
    max_factor = factor;
    factor=2;
  } else {
    factor++;
  }
};

console.log(max_factor);
