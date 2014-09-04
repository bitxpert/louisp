$(document).ready (function(){
    $('.btn_side').click(function(e) {
  var $this = $(this);
  if (!$this.hasClass('active')) {
    $('.btn_side').removeClass("active");
    $this.addClass('active');
  }
});
  });