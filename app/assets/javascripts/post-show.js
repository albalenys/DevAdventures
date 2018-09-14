$('#tag-list').ready(function() {
  $("span[id^='tag-']").hover(function(event) {
    let parentElement = event.target.closest("span[id^='tag-']");
    deleteButton = $(parentElement).find('.sub-icon');
    deleteButton.show();
  },
  function() {
    deleteButton.hide();
  });
});

$('#resource-list').ready(function() {
  $("li[id^='resource-']").hover(function(event) {
    let parentElement = event.target.closest('li');
    editLinks = $(parentElement).find('.edit-links');
    editLinks.show();
  },
  function() {
    editLinks.hide();
  });
});