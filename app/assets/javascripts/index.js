$('#welcome').ready(function() {
  $("a[href*='#']").click(function() {
    // Parallex reference: http://www.1stwebdesigner.com/create-scrolling-parallax-website/
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

  $(window).scroll(function() {
    // Dynamically change blur effect (on welcome section) according to scroll position.
    let height = $(window).scrollTop();
    let blurEffect = `blur(${height/50}px)`;

    $('.blurScroll').css('-webkit-filter', blurEffect);
    $('.blurScroll').css('-moz-filter', blurEffect);
    $('.blurScroll').css('-o-filter', blurEffect);
    $('.blurScroll').css('-ms-filter', blurEffect);
    $('.blurScroll').css('filter', blurEffect);
  });

  $('#welcome h1').click(function() {
    renderRandomBg();
  });
});
