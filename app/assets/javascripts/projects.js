$('#projects-container').ready(function() {
  $('#projects-container').on({
    mouseenter: function(event) {
      let parentElement = event.target.closest("div[id^='project-']");
      editLinks = $(parentElement).find('.edit-links');
      editLinks.show();
    },
    mouseleave: function() {
      editLinks.hide();
    } 
  }, "div[id^='project-']");
});
