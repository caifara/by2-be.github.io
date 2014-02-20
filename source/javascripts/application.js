$(function(){
  $(".player").mb_YTPlayer();

  if(window.location.hash == '#bedankt'){
    $('#thank-you').removeClass("hidden");
  }
});

