$(document).ready(function() {
  renderRandomColors();
});

let renderRandomColors = function() {
  let randInt = function(maxInt) { 
    return Math.floor((Math.random() * maxInt));
  }
  let colors = ['#66C2E0', '#ff6666', '#00cc99', '#bb99ff', '#FFE593'];
  let randomInt = randInt(5);
  let hoverColorClass = `hover-color-${randomInt}`;
  let mainColor = colors[randomInt];
  let linksColor = colors[randInt(4)];

  $('#main-heading').css('color', mainColor);
  $('a').css('border-bottom', `0.1em dashed ${mainColor}`);
  $('a').css('color', linksColor);
  $('pre').css('border-left', `solid ${mainColor} 0.6em`);
  $('.sub-button').css('background', mainColor);
  $('nav a').addClass(hoverColorClass);
  $('nav a').css('box-shadow', `0 0 0 0 ${mainColor} inset`);
  $('.tag').css('border', `solid ${mainColor} 1px`);
}
