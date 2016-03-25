$(document).ready(function() {
  var box_array = [];
  var boxes = 16;
  var box_size = set_size(boxes);
  for(i=0;i<Math.pow(boxes, 2);i++) {
    box_array[i] = "<div class='box'>" + i + "</div>"
  }

  $('.container').append(box_array.join(''));
  $('.box').css('width', box_size+"px");
  $('.box').css('height', box_size+"px");

  $('.box').hover(function(){
    $(this).css('background-color', 'red');
  })
});

function clear_boxes() {
  $('.box').css('background-color', $('.box').css('background-color'));
}

function set_size(n) {
  var width = $('.container').width();
  return (width-2*n)/n;
}
