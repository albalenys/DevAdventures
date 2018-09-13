$('#tag-list').ready(function() {
  $("li[id^='tag-']").hover(function(event) {
    let parentElement = event.target.closest('li');
    deleteButton = $(parentElement).find('.sub-icon');
    deleteButton.show();
  },
  function() {
    deleteButton.hide();
  });
});