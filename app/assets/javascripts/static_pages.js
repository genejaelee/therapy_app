function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

window.mobilecheck = function() {
	var check = false;
	(function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
	return check; 
}

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

// Popup stuff
function openPopup(popup){
	$(popup).animate({top: "0px"}, 500, "easeInOutCubic");
}

function closePopup(popup){
	var tutorialHeight = $(popup).innerHeight();
	$(popup).animate({top: "-" + tutorialHeight + "px"}, 500, "easeInOutCubic");
}

function showTimePicker(thisProfile){
	thisProfile.find('.time-field').timepicker('show');
}

$(".static_pages.home").ready(function() {
	
  $(window).bind('scroll',function(e){
      //parallaxScroll();
  });
 
  function parallaxScroll(){
      var scrolled = $(window).scrollTop();
      $('.text-container').css('margin-top',(50-(scrolled*.1))+'px');
			$('.text-container').css('opacity',(-0.5+(scrolled*.003)));
  }
});

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
	
	var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
  $(function() {
    $( ".date-field" ).datepicker({ dateFormat: 'mm/dd/yy', 
																							minDate: 0,
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