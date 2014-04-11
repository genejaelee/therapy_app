// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var reduceMarginsIfAllAdded = function(element) {
	if ($('#add-subsection-one').css('display') == 'none' && $('#add-subsection-two').css('display') == 'none' ) {
		$('#add-subsection-container').css('display', 'none');
	}
}

var addSubsection = function(element) {
	$('#add-subsection-one').click(function(){
		$('#approach-subsection-one').stop().fadeOut(0).promise().done(function() {
			$('#approach-subsection-one').stop().fadeIn('slow').promise();
		});
		$(this).css('display', 'none');
		reduceMarginsIfAllAdded()
	});
	
	$('#add-subsection-two').click(function(){
		$('#approach-subsection-two').stop().fadeOut(0).promise().done(function() {
			$('#approach-subsection-two').stop().fadeIn('slow').promise();
		});
		$(this).css('display', 'none');
		reduceMarginsIfAllAdded()
	});
}

function renderCalendarForm() {
	$('.profile-more-container').css('display', 'none');
	$('.calendar-form-container').css('display', 'inline-block');
}

function renderProfileMore() {
	$('.profile-more-container').css('display', 'inline-block');
	$('.calendar-form-container').css('display', 'none');
}

function renderEitherCalendarOrProfile(thisButton) {
	if ($(thisButton).parent().hasClass('request-call-button')) {
		renderCalendarForm();
	}
	else {
		renderProfileMore();
	}
}

function openCloseOnClick(element, thisButton, min, max) {
	if ($(element).hasClass("closed")) {
		$(thisButton).text('Close');
		$(element).animate({height: max + "px"}, 500, "easeOutCubic", function(){
			$(element).removeClass("closed");
			$(element).addClass("opened");
		});
	}
	if ($(element).hasClass("opened") && thisButton.text() == "Close") {
		if ($(thisButton).parent().hasClass("request-call-button")) {
			$(thisButton).text('Request a call');
		}
		else {
			$(thisButton).text('Read More');
		}
		$(element).animate({height: min + "px"}, 500, "easeOutCubic", function(){
			$(element).removeClass("opened");
			$(element).addClass("closed");
		});
	}
}