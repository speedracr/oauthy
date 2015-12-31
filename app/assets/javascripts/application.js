//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  setTimeout(function(){
    $('#notice-wrapper').fadeOut("slow", function(){
      $(this).remove();
    })
  }, 4500);
});
