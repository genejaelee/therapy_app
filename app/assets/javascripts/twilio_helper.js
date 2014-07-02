$(".chats.view").ready(function() {
	console.log('loading twilio helper js');
	// hide buttons initially
	$('.hangup').hide();
	$('.answer').hide();
	
  Twilio.Device.connect(function (conn) {
    $('.call').hide();
		$('.answer').hide();
		$('.hangup').show();
  });
	
  Twilio.Device.disconnect(function (conn) {
    $('.hangup').hide();
		$('.answer').hide();
		$('.call').show();
  });
	
  Twilio.Device.incoming(function (conn) {
    $('.hangup').hide();
		$('.call').hide();
		$('.answer').show();
  });
});

var hideAllTwilioButtons = function() {
  $('.twilio-button').hide();
}

var disableTwilioButtons = function(button) {
	$(button).attr('disabled','disabled');
	$(button).addClass('disabled');
}

var enableTwilioButtons = function(button) {
	$(button).removeAttr('disabled');
	$(button).removeClass('disabled');
}