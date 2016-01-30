$(document).ready(function(){
  console.log("Loaded.");
  setTimeout(function(){
    $('#notice-wrapper').fadeOut("slow", function(){
      $(this).remove();
    })
  }, 4500);
});
