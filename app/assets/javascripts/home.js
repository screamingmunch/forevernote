$(function() {
  // jquery to change active state of nav bar
   $('a').click(function() {
    $('a').parent().removeClass('active');
    $(this).parent().addClass('active');
  })
});