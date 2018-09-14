$('#projects-list').ready(function() {
  $("div[id^='project-']").hover(function(event) {
    let parentElement = event.target.closest("div[id^='project-']");
    editLinks = $(parentElement).find('.edit-links');
    editLinks.show();
  },
  function() {
    editLinks.hide();
  });
});