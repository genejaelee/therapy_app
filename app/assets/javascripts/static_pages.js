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

function scrollToTheBottomUnlessScrolled(element) {
	var messagesContainerHeight = $('.messages-container').outerHeight();
	var threshold = 100
	var scrollBottom = messagesContainerHeight - ($('#messages').scrollTop() + $('#messages').outerHeight() - 20);
	if (scrollBottom < threshold) {
		element.animate({scrollTop: 2000000}, 500, 'easeInOutCubic'); 
	}
}

function scrollToBottomOfAndFocusOn(toScroll, toFocusOn){
	$(toScroll).parent().stop().animate({
		scrollTop: $(toScroll).height() + $('#spinner').height()},
		1000, "easeOutCubic", function(){
			$(toFocusOn).focus();
		});
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
	$(function() {
	    FastClick.attach(document.body);
	});
	
	// deal with alert stuff
	if ($('.alert-bar .alert').text().length > 1) {
		$('body').animate({ 'marginTop' : '50px'}, 400);
	}
	else {
	}
	$('.close-alert').click(function(){
		$('body').animate({ 'marginTop' : '0px'}, 400);
	});
	
	$('.phone-field').mask('(000) 000-0000');
	$('.date-field').mask('00/00/00');
	//$('.time-field').mask('00:00AA');
	
	var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
  $(function() {
    $( ".date-field" ).datepicker({ dateFormat: 'mm/dd/yy', 
																							minDate: 0,
																							onSelect: function(date){
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