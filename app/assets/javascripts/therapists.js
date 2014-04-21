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

function mouseEnterAnimateIndex(currentHeight) {
	$('.profile-link-panel .bg-container .inner-container').bind("mouseenter", function() {
		var thisProfile = $(this).parent().parent();
		if (thisProfile.hasClass("closed")) {
			thisProfile.find('.tap-plus-sign').css('color', '#90bc64');
			thisProfile.stop().animate({height: (currentHeight + 5) + "px"}, 200, "easeOutCubic", function() {
				$(this).unbind('mouseenter');
			});
		}
	});

	$('.profile-link-panel .bg-container .inner-container').bind("mouseleave", function() {
		var thisProfile = $(this).parent().parent();
		if (thisProfile.hasClass("closed")) {
			thisProfile.find('.tap-plus-sign').css('color', '#ddd');
			thisProfile.stop().animate({height: (currentHeight) + "px"}, 100, "easeOutCubic", function() {
				$(this).unbind('mouseleave');
			});
		}
	});
}

function openCloseOnClick(element, min, max) {
	if ($(element).hasClass("closed")) {
		$(element).removeClass("closed");
		goToByScroll(element);
		$(element).stop().animate({height: max + "px"}, 500, "easeOutCubic", function(){
			$(element).addClass("opened");
		});
		
		timeRangesArray = [];
		//AJAX
		updateEventData(element);
		//get event data
		
	}
	if ($(element).hasClass("opened")) {
		$(element).removeClass("opened");
		$(element).stop().animate({height: (min-5) + "px"}, 300, "easeOutCubic", function(){
				$(element).stop().animate({height: min + "px"}, 150, "easeOutCubic", function(){});
				$(element).addClass("closed");
		});
	}
}

function hideNavBar() {
	if ($(window).scrollTop() == 0) {
		$('.navbar').stop().animate({'height' : '0px'}, 0);
	}
	
	$(window).scroll(function() {
		if ($(window).scrollTop() < 5) {
			$('.navbar').stop().animate({'height' : '0px'}, 150, 'easeOutCubic');
		}
		else {
			$('.navbar').stop().animate({'height' : '50px'}, 150, 'easeOutCubic');
		}
	});
}

// AJAX STUFF

var timeRangesArray = [];

function updateEventData(element){
	var id = element.data('id');
	console.log('call ajax');
	$.ajax({
		url: "/this_therapist_events",
		type: "POST",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		data: { therapist_id: id },
		success: function(data) {
			console.log(JSON.stringify(data));
			for (var i = 0; i < data.length; i++) {
				var startTime = data[i].start_time;
				var startTimeArray = startTime.split('');
				var endTimeArray = [];
				
				if (startTimeArray.length == 7) {
					var endHourInteger = parseInt(startTimeArray.slice(0,1)) + 1;
				}
				if (startTimeArray.length == 6) {
					var endHourInteger = parseInt(startTimeArray[0]) + 1;
					var endHour = endHourInteger.toString();
					console.log(endHour);
					endTimeArray.push(endHour, startTimeArray.slice(1,6).join(''));
					console.log(endTimeArray.join(''));
				}
				
				endTime = endTimeArray.join('');
				var aTimeRange = [startTime, endTime];
				console.log(aTimeRange);
				timeRangesArray.push(aTimeRange);
				console.log(timeRangesArray);
				if (i == (data.length - 1)) {
					console.log('run callback!');
					initTimePickerWithSlots(element, timeRangesArray);
				}
			}
		}
	});
}

function initTimePickerWithSlots(element, array){
	console.log("this is the timeslot arrays" + array[0] + array[1]);
	console.log(element.attr('class'));
  element.find('.time-field').timepicker({
		'step': 60,
  	'disableTimeRanges': array
  });
}