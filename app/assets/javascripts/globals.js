$(document).ready(function() {
  renderRandomBg();
  renderRandomColors();
});

let renderRandomBg = function() {
  let randInt = Math.floor((Math.random() * 3) + 1);
  $("#welcome").attr("class", function(i, c) {
    return c.replace(/(^|\s)bg-img-\S+/g, '');
  });
  $("#welcome").addClass(`bg-img-${randInt}`);
}

let renderRandomColors = function() {
  let randInt = function() { 
    return Math.floor((Math.random() * 5) + 1);
  }
  let randPrimaryColor = `primary-color-${randInt()}`;
  let randSubColor = `sub-color-${randInt()}`;

  $("#post-title").addClass(`${randPrimaryColor} font`);
  $("a, a:visited").addClass(`${randPrimaryColor} line`);
  $("pre").addClass(`${randPrimaryColor} border`);
  $(".sub-button").addClass(`${randPrimaryColor} background`);
  $("header a").addClass(randPrimaryColor);
  $("a, a:visited").addClass(randSubColor);
  $(".tag").addClass(`${randPrimaryColor} border-dash`);
}