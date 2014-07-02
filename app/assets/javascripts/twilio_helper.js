$(".chats.view").ready(function() {
	// hide buttons initially
	$('.hangup').hide();
	$('.answer').hide();
	
  Twilio.Device.connect(function (conn) {
    $('.call').hide();
		$('.hangup').show();
  });
	
  Twilio.Device.disconnect(function (conn) {
    $('.hangup').hide();
		$('.call').show();
  });
	
  Twilio.Device.incoming(function (conn) {
    $('.hangup').hide();
		$('.call').hide();
		$('.answer').show();
  });
	
	var hideAllTwilioButtons = function() {
    $('.hangup').hide();
		$('.call').hide();
		$('.answer').hide();
	}
});