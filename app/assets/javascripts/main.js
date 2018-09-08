// Parallex reference: http://www.1stwebdesigner.com/create-scrolling-parallax-website/

$(document).ready(function(){
  renderRandomBg();
  renderRandomColors();

  $("a[href*='#']").click(function() {
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

    $(".blurScroll").css("-webkit-filter", blurEffect);
    $(".blurScroll").css("-moz-filter", blurEffect);
    $(".blurScroll").css("-o-filter", blurEffect);
    $(".blurScroll").css("-ms-filter", blurEffect);
    $(".blurScroll").css("filter", blurEffect);
  });
});

var renderRandomBg = function() {
  let randInt = Math.floor((Math.random() * 3) + 1);
  $("#welcome").addClass(`bg-img-${randInt}`);
}

var renderRandomColors = function() {
  let randInt = function() { 
    return Math.floor((Math.random() * 4) + 1);
  }
  let firstRandInt = randInt();
  let secondRandInt = randInt();

  while (firstRandInt == secondRandInt) {
    secondRandInt = randInt();
  }

  let randPrimaryColor = "primary-color-" + firstRandInt;
  let randSubColor = "sub-color-" + secondRandInt;

  $(".subtitle, .post-title").addClass(`${randPrimaryColor} font`);
  $("a, a:visited").addClass(`${randPrimaryColor} line`);
  $("pre").addClass(`${randPrimaryColor} border`);
  $(".sub-button").addClass(`${randPrimaryColor} background`);
  $("header a").addClass(randPrimaryColor);
  $("a, a:visited").addClass(randSubColor);
}