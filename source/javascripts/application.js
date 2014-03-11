$(function(){
  var desktop_browser = window.matchMedia("(min-width: 980px)").matches;
  if(desktop_browser){
    $(".player").mb_YTPlayer();
    $(window).stellar();
  }

  if(window.location.hash == '#bedankt'){
    $('#thank-you').removeClass("hidden");
  }
});

