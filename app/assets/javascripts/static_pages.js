function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

function updateCountdown() {
    // 500 is the max message length
    var remaining = 500 - jQuery('#explanation-text').val().length;
    jQuery('.countdown').text(remaining + ' characters remaining.');
}

var hide_element = function(element) {
	$( element ).stop().animate( {opacity : 0 }, 300, function(){
		$( element ).css('display', 'none');
	});
}

var show_element = function(element) {
	$( element ).stop().animate( {opacity : 1 }, 300, function(){
	});
	$( element ).css('display', 'inline');
}

var fadeThis = function(element) {
	$(element).stop().animate({ opacity: 0.5 }, 300, function(){
	});
}
var fadeThisIn = function(element) {
	$(element).stop().animate({ opacity: 1.0 }, 300, function(){
	});
}

var ready = function() {
	$('.cta-button2').click(function(){
	  $('html, body').animate({scrollTop:0}, 1000, 'easeOutCubic');
	});
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
	//updating countdown on explanation for therapist
	updateCountdown();
	    $('#explanation-text').change(updateCountdown);
	    $('#explanation-text').keyup(updateCountdown);
};

$( document ).ready(ready);
$( document ).on('page:load', ready);