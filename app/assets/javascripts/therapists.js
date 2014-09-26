// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function isScrolledIntoView(elem){
 var docViewTop = $(window).scrollTop();
 var docViewBottom = docViewTop + $(window).height();

 var elemTop = $(elem).offset().top;
 var elemBottom = elemTop + $(elem).height();

 return ((elemBottom >= docViewTop) && (elemTop <= docViewBottom)
   && (elemBottom <= docViewBottom) &&  (elemTop >= docViewTop) );
}
 
function checkIfVideoInView(){
	videos = $('.video');
	$.each(videos, function(index){
		var video = videos[index]
	  if(isScrolledIntoView(video) && video.currentTime == 0){
			console.log('scrolled into view');
			pauseAllVideos();
			video.play();
	  }
	});
}

function pauseAllVideos() {
	var videos = $('.video');
	$.each(videos, function(index){
		videos[index].pause();
	});
}

function playPause(id) { 
	var video = document.getElementById(id);
    if (video.paused){
			pauseAllVideos();
      video.play(); 
		}
    else { 
      video.pause();
		} 
}

function loadVideo(video_name, name){
	var video = document.getElementById(name + '-video');
	video.src = "/assets/" + name + "/" + video_name + ".mp4";
	video.load();
	video.play();
}

$(".therapists").ready(function() {
	//therapist profile stuff
	//addSubsection()
	
	$(window).on('scroll', function(){
		checkIfVideoInView();	
	});
	
	$('.video').bind('click', function(){
		var videoId = $(this).attr('id');
		playPause(videoId);
	})
	
	$('.video-control-panel').hide();
	$('.video').bind('ended', function(){
		console.log('ended');
		$(this).siblings('.video-control-panel').show().css('opacity', '0').animate({ opacity: 0.8 }, 400, function(){
		});
	});
	
	$('.video-button').click(function(){
		var controlPanel = $(this).parent('.video-control-panel');
		controlPanel.animate({ opacity: 0.0}, 400).hide();
		var name = controlPanel.data("name");
		var type = $(this).data("type");
		pauseAllVideos();
		loadVideo(type, name);
	});
	
	
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
	
	//therapist index stuff
	$('#open-email-dropbox').click(function(){
		$('.email-dropbox').css({'display' : 'block',
														'margin-top' : '-151px',
														'opacity' : '0'});
		$('.email-dropbox').stop().animate({opacity: 1.0, 'margin-top' : '0px'}, 350, "easeOutCubic")
	});
	
	//mouseEnterAnimateIndex();
	
	$('.profile-link-panel .bg-container .top-panel').click(function(){
		var maxHeight = setProfilePanelHeights();
		var thisProfile = $(this).parent().parent();
		//openCloseOnClick(thisProfile, $(this).outerHeight(), maxHeight);
	});
	
	var disabledArray = {
		1 : [ '1pm', '2pm', '4pm' ],
		2 : [ '11am', '2pm', '4pm' ],
		3 : [ '3pm', '4pm', '5pm' ],
		4 : [ '8am', '9am' ],
		5 : [ '1pm', '2pm', '3pm' ],
		6 : [ '10am', '11am', '6pm' ]
	};
	
	$.each(disabledArray, function (day, times) {
		$('.select-cell[data-day=' + day + ']').each(function(){
			console.log($(this).html());
			var thisTimeSlot = $(this).attr('data-time');
			var thisSlot = $(this);
			$.each(times, function(i, time){
				console.log(thisTimeSlot + " " + time);
				if($.trim(thisTimeSlot) == time){
					console.log('match');
					thisSlot.removeClass('enabled').addClass('disabled');
				}
			});
		});
	});
	
	$('.enabled').hover(function(){
		var timeClass = $(this).attr('data-time');
		var dayClass = $(this).attr('data-day');
		$('.'+$.trim(timeClass)).css({'background-color' : '#fff', 'color' : '#424242'});
		$('.'+$.trim(dayClass)).css({'background-color' : '#fff', 'color' : '#424242'});
	});
	
	$('.enabled').on('mouseleave', function(){
		var timeClass = $(this).attr('data-time');
		var dayClass = $(this).attr('data-day');
		$('.'+$.trim(timeClass)).css({'background' : 'none', 'color' : '#fff'});
		$('.'+$.trim(dayClass)).css({'background' : 'none', 'color' : '#fff'});
	});
	
	$('.enabled').click(function(){
		$('.enabled').removeClass('selected');
		$(this).addClass('selected');
		$('#event_suggested_time').val($(this).attr('data-datetime'));
	});
	
});

function mouseEnterAnimateIndex() {
	$('.profile-link-panel .bg-container .top-panel').bind("mouseenter", function() {
		var thisProfile = $(this).parent().parent();
		if (thisProfile.hasClass("closed")) {
			thisProfile.find('.tap-plus-sign').css('color', '#90bc64');
			thisProfile.stop().animate({height: $(this).outerHeight() + 10 + "px"}, 150, "easeInOutCubic", function() {
				$(this).unbind('mouseenter');
			});
		}
	});

	$('.profile-link-panel .bg-container .top-panel').bind("mouseleave", function() {
		var thisProfile = $(this).parent().parent();
		if (thisProfile.hasClass("closed")) {
			thisProfile.find('.tap-plus-sign').css('color', '#ddd');
			thisProfile.stop().animate({height: $(this).outerHeight() + "px"}, 150, "easeInOutCubic", function() {
				$(this).unbind('mouseleave');
				thisProfile.removeAttr('style');
			});
		}
	});
}

function setProfilePanelHeights() {
	var windowWidth = $(window).width()
	if(windowWidth < 480) {
		var maxHeight = '800';
	}
	else if(480 < windowWidth && windowWidth < 767) {
		var maxHeight = '800';
	}
	else if(767 < windowWidth && windowWidth < 960) {
		var maxHeight = '600';
	}
	else if(960 < windowWidth) {
		var maxHeight = '600';
	}
	return maxHeight;
}

function openCloseOnClick(element, min, max) {
	if (element.hasClass("closed")) {
		element.removeClass("closed");
		goToByScroll(element);
		var fullHeight = element.find('.bottom-panel').outerHeight() + min;
		element.stop().animate({height: fullHeight + "px"}, 500, "easeOutCubic", function(){
			element.addClass("opened");
		});
	}
	
	if (element.hasClass("opened")) {
		element.stop().animate({height: element.find('.top-panel').outerHeight() + "px"}, 300, "easeOutCubic", function(){
			element.removeClass("opened").addClass("closed");
		});
	}
}

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

// AJAX STUFF

var timeRangesArray = [];

function updateEventData(element){
	timeRangesArray =[];
	var id = element.data('id');
	var date = element.find('.date-field').val();
	console.log(date);
	$.ajax({
		url: "/this_therapist_events",
		type: "POST",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		data: { therapist_id: id, date: date },
		success: function(data) {
			console.log(JSON.stringify(data));
			if (data.length == 0) {
				initTimePickerWithSlots(element, timeRangesArray);
			}
			else {
				for (var i = 0; i < data.length; i++) {
					var startTime = data[i];
					var startTimeSplit = startTime.split('');
					var startTimeHour = startTimeSplit.slice(0,2).join('');
					var startTimeMinute = startTimeSplit.slice(4,5).join('');
				
					var endTimeMinute = (parseInt(startTimeMinute, 10) + 59).toString();
					var endTimeHour = (parseInt(startTimeHour, 10) + 1).toString();
					var endTimeArray = [];
					endTimeArray.push(endTimeHour, ':', '00');
					var endTime = endTimeArray.join('');
				
					var aTimeRange = [startTime, endTime];
					//push arrays of start and end time to time ranges array
					timeRangesArray.push(aTimeRange);
					if (i == (data.length - 1)) {
						//run callback function
						initTimePickerWithSlots(element, timeRangesArray);
					}
				}
			}
		}
	});
}

function initTimePickerWithSlots(element, array){
	console.log('init new timepicker');
	element.find('.time-field').timepicker('remove');
  element.find('.time-field').timepicker({
		'step': 60,
  	'disableTimeRanges': array,
		'minTime': '08:00',
		'maxTime': '22:00'
  });
}