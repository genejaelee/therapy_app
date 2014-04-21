function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

// text area functions
function updateCountdown() {
    // 500 is the max message length
		var limit = 141;
		var wordCount = $(this).val().trim().split(" ").length;
		var remainingWords = limit - $(this).val().trim().split(" ").length;
    $('#counter-text').text(remainingWords + ' words remaining.');
		
		$(this).keypress(function(e) {
			if (wordCount > limit) {
				e.preventDefault();
			} else if (wordCount < limit) {
				$(this).unbind('keypress');
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

function showTimePicker(thisProfile){
	thisProfile.find('.time-field').timepicker('show');
}

var ready = function() {
	$('.phone-field').mask('(000) 000-0000');
	$('.date-field').mask('00/00/00');
	$('.time-field').mask('00:00AA')
	
	var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
  $(function() {
    $( ".datepicker-container" ).datepicker({ dateFormat: 'mm/dd/yy', 
																							inline: true,
																							altField: '.date-field',
																							minDate: 0,
																							onSelect: function(date){
																								//update time slot availabilities
																								var thisProfile = $(this).closest('.profile-link-panel');
																								updateEventData(thisProfile);
																							}
																						});
  });
	
  $(function() {
    $( ".time-field" ).timepicker({'step': 60});
  });
	
	//updating countdown on explanation for therapist
	$('#explanation-text').change(updateCountdown);
	$('#explanation-text').keyup(updateCountdown);
	
	$('#therapist-bio').change(updateCountdown);
	$('#therapist-bio').keyup(updateCountdown);
	
	//therapist profile stuff
	//addSubsection()
	
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
	
	//therapist home page stuff
	hideNavBar()
	
	//therapist index stuff
	$('#open-email-dropbox').click(function(){
		$('.email-dropbox').css({'display' : 'block',
														'margin-top' : '-151px',
														'opacity' : '0'});
		$('.email-dropbox').stop().animate({opacity: 1.0, 'margin-top' : '0px'}, 350, "easeOutCubic")
	});
	
	if($('body').is('#therapist-index')) {
		var currentHeightPixels = $('.profile-link-panel').css('height');
		var currentHeight = parseInt(currentHeightPixels.slice(0, 3));
	}
	
	mouseEnterAnimateIndex(currentHeight);
	
	$('.profile-link-panel .bg-container .inner-container').click(function(){
		var windowWidth = $(window).width()
		if(windowWidth < 480) {
			var maxHeight = '1350';
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
	
	//handle unbeforeunload method for pages x y z
	$('.button').click(function() {
		window.onbeforeunload = null;
	});
	$('button').click(function() {
		window.onbeforeunload = null;
	});
	if($('body').is('#form-page')) {
		window.onbeforeunload = function() {
			return("Your changes may not be saved.");
		}
	}
}

$( document ).ready(ready);
$( document ).on('page:load', ready);