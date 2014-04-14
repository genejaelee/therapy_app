function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

// text area functions
function updateCountdown() {
    // 500 is the max message length
		var limit = 241;
		var wordCount = $('#explanation-text').val().trim().split(" ").length;
		var remainingWords = limit - $('#explanation-text').val().trim().split(" ").length;
    $('#counter-text').text(remainingWords + ' words remaining.');
		
		$('#explanation-text').keypress(function(e) {
			if (wordCount > limit) {
				e.preventDefault();
			} else if (wordCount < limit) {
				$('#explanation-text').unbind('keypress');
			}
		});
}

function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}

function goToByScroll(element){
	$('html,body').stop().animate({
		scrollTop: $(element).offset().top},
		500, "easeOutCubic");
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
	$('.phone-field').mask('(000) 000-0000');
	$('.date-field').mask('00/00/0000');
	$('.time-field').mask('00:00AA')
	
	$('.cta-button2').click(function(){
	  $('html,body').stop().animate({
			scrollTop: 0}, 
			1000, "easeOutCubic", function(){
				$('#user_email').focus();
			});
	});
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
  $(function() {
    $( ".datepicker-container" ).datepicker({ dateFormat: 'mm/dd/yy', inline: true, altField: '.date-field' });
  });
	
  $(function() {
    $( ".time-field" ).timepicker();
  });
	
	//updating countdown on explanation for therapist
	$('#explanation-text').change(updateCountdown);
	$('#explanation-text').keyup(updateCountdown);
	
	//therapist profile stuff
	addSubsection()
	
	$('.current_therapist_name').css('display', 'none');
	$('#user_current_therapist').change(function(){
		if ($(this).val() == "Yes") {
			$('.current_therapist_name').css('display', 'block');
			$('.current_therapist_name').css('opacity', '0');
			$('.current_therapist_name').stop().animate({ opacity: 1.0 }, 400, function(){
	});
		}
		else {
			$('.current_therapist_name').css('display', 'none');
		}
	});
	
	$('#welcome-nav-item').click(function(){
		goToByScroll('.welcome-panel')
	});
	$('#about-therapy-nav-item').click(function(){
		goToByScroll('#approach-panel')
	});
	$('#about-nav-item').click(function(){
		goToByScroll('.therapist-about-panel')
	});
	$('#contact-nav-item').click(function(){
		goToByScroll('#therapist-contact')
	});
	
	var currentHeightPixels = $('.profile-link-panel').css('height');
	var currentHeight = currentHeightPixels.slice(0, 3)
	$('.profile-link-panel .bg-container .inner-container').click(function(){
		var windowWidth = $(window).width()
		if(windowWidth < 480) {
			var maxHeight = '1300';
		}
		else if(480 < windowWidth && windowWidth < 767) {
			var maxHeight = '1200';
		}
		else if(767 < windowWidth && windowWidth < 960) {
			var maxHeight = '850';
		}
		else if(960 < windowWidth) {
			var maxHeight = '775';
		}
		var thisProfile = $(this).parent().parent();
		openCloseOnClick(thisProfile, currentHeight, maxHeight);
	});
	
	// calendar
	$('#calendar').fullCalendar({
	  // put your options and callbacks here
		editable: true,
		slotMinutes: 30,
		dragOpacity: "0.5"
	});
	
	if (is_touch_device()) {
		var arrowDown = $('.arrow-down')
		arrowDown.on( 'touchend', function(){
			goToByScroll(".signup-panel");
		});
		
		$('.profile-link-panel .bg-container .inner-container').on( 'touchend', function(){
			if(windowWidth < 480) {
				var maxHeight = '1300px';
			}
			var thisProfile = $(this).parent().parent();
			openCloseOnClick(thisProfile, currentHeight, maxHeight);
		});
	}
}

$( document ).ready(ready);
$( document ).on('page:load', ready);