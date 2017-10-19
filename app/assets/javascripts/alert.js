$(document).on('turbolinks:load', function(){
  // Remove alert/notice after 4 seconds
  $(".alert").delay(4000).fadeOut();
  $(".notice").delay(4000).fadeOut();
});