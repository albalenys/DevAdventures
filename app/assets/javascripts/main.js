// Parallex reference: http://www.1stwebdesigner.com/create-scrolling-parallax-website/

$(document).ready(function(){
  hljs.initHighlightingOnLoad();
  randBackground();
  renderRandColors();

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

  $(window).scroll(function (event) {
    var height = $(window).scrollTop();
    var blur_effect = "blur(" + height/50 + "px)";

    if(height  > 680) {
      $("header").css("background-color", "#FFF");
    }
    else {
      $("header").css("background-color", "transparent");
    }

    if(height > 80) {
      $("#welcome").addClass("blur");
      $(".blur").css("-webkit-filter", blur_effect);
      $(".blur").css("-moz-filter", blur_effect);
      $(".blur").css("-o-filter", blur_effect);
      $(".blur").css("-ms-filter", blur_effect);
      $(".blur").css("filter", blur_effect);
    }
    else {
      $("#welcome").removeClass("blur");
      $("#welcome").removeAttr("style");
    }
  });
});

var randBackground = function() {
  var randInt = Math.floor((Math.random() * 3) + 1);
  $("#welcome").addClass("bg-img-" + randInt);
}

var renderRandColors = function() {
  var randInt = function() {
    return Math.floor((Math.random() * 4) + 1);
  }
  var firstInt = randInt();
  var secondInt = randInt();

  while (firstInt == secondInt) {
    secondInt = rantInt();
  }

  var randPrimaryColor = "primary-color-" + firstInt;
  var randSubColor = "sub-color-" + secondInt;

  $(".subtitle").addClass(randPrimaryColor + " font");
  $("a, a:visited").addClass(randPrimaryColor + " line");
  $("pre").addClass(randPrimaryColor + " border");
  $(".sub-button").addClass(randPrimaryColor + " background")
  $("header a").addClass(randPrimaryColor);
  $("header a, footer a").addClass("remove-border");

  $("a, a:visited").addClass(randSubColor);
}