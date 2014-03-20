function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

// text area functions
function updateCountdown() {
    // 500 is the max message length
		var limit = 141;
		var remainingWords = limit - $('#explanation-text').val().trim().split(" ").length;
    $('#counter-text').text(remainingWords + ' words remaining.');
}

function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}

function goToByScroll(id){
	$('html,body').animate({
		scrollTop: $("."+id).offset().top},
		'slow');
}

//legacy functions to hide and show things
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
			
	if (is_touch_device()) {
		var arrowDown = $('.arrow-down')
		arrowDown.on( 'touchend', function(){
			goToByScroll("signup-panel");
		});
		
	}
};

$( document ).ready(ready);
$( document ).on('page:load', ready);