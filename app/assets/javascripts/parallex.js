// URL Reference: http://www.1stwebdesigner.com/create-scrolling-parallax-website/

$(document).ready(function(){
  $('a[href*=#]').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
    && location.hostname == this.hostname) {
      var $target = $(this.hash);
      $target = $target.length && $target
      || $('[name=' + this.hash.slice(1) +']');
      if ($target.length) {
        var targetOffset = $target.offset().top;
        $('html,body')
        .animate({scrollTop: targetOffset}, 1000);
       return false;
      }
    }
  });

  $(window).scroll(function (event) {
    var height = $(window).scrollTop();
    if(height  > 680) {
      $("header").css("background-color", "#FFF");
    }
    else {
      $("header").css("background-color", "transparent");
    }
  });
});