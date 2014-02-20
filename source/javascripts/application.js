$(function(){
  $(".player").mb_YTPlayer();
  $(window).stellar();

  if(window.location.hash == '#bedankt'){
    $('#thank-you').removeClass("hidden");
  }
});

