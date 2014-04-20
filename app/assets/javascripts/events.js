// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$.rails.allowAction = function(link) {
  if ( undefined === link.attr('data-confirm') ) {
    return true;
  }
  showConfirmDialog(link);
  return false;
};

confirmed = function(link) {
  link.removeAttr('data-confirm');
  return link.trigger('click.rails');
};

showConfirmDialog = function(link) {
  var html, message;
  message = link.attr('data-confirm');
  html = "<div id=\"dialog-confirm\" title=\"Before you set up your appointment\">\n  <p>" + message + "</p>\n</div>";
  return $(html).dialog({
    resizable: false,
    modal: true,
		draggable: false,
		show: 'fade',
		
		open: function() {
			$('.ui-widget-overlay', this).css('opacity', '0').hide().fadeIn();
		},
		
    buttons: {
      OK: function() {
        confirmed(link);
        return $(this).dialog("close");
      },
      Cancel: function() {
        return $(this).dialog("close");
      }
    }
  });
};