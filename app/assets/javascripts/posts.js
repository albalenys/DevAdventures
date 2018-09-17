$('#posts-container').ready(function() {
  $('#posts-container').on({
    mouseenter: function(event) {
      let parentElement = event.target.closest("li[id^='post-']");
      editButton = $(parentElement).find('.fa');
      editButton.show();
    },
    mouseleave: function() {
      editButton.hide();
    } 
  }, "li[id^='post-']");
});

$('#tag-list').ready(function() {
  $('#tag-list').on({
    mouseenter: function(event) {
      let parentElement = event.target.closest("span[id^='tag-']");
      deleteButton = $(parentElement).find('.fa');
      deleteButton.show();
    },
    mouseleave: function() {
      deleteButton.hide();
    } 
  }, "span[id^='tag-']");
});

$('#resource-list').ready(function() {
  $('#resource-list').on({
    mouseenter: function(event) {
      let parentElement = event.target.closest("li[id^='resource-']");
      editLinks = $(parentElement).find('.edit-links');
      editLinks.show();
    },
    mouseleave: function() {
      editLinks.hide();
    } 
  }, "li[id^='resource-']");
});
