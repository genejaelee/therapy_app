function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

var hide_element = function(element) {
	$( element ).stop().animate( {opacity : 0 }, 300, function(){
		$( element ).css('visibility', 'hidden');
	});
}

var show_element = function(element) {
	$( element ).stop().animate( {opacity : 1 }, 300, function(){
	});
	$( element ).css('visibility', 'visible');
}

var ready = function() {
	$('.cta-button2').click(function(){
	  $('html, body').animate({scrollTop:0}, 1000, 'easeOutCubic');
	});
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
	if(!is_touch_device()) {
		$('#PMO-def').mouseover(function(){
			$(this).stop().animate({ opacity: 0.5 }, 300, function(){
			});
			show_element('#PMO-pop-over');
		});
	
		$('#PMO-def').mouseleave(function(){
			$(this).stop().animate({ opacity: 1.0 }, 300, function(){
			});
			hide_element('#PMO-pop-over');
		});
	
		$('#reboot-def').mouseover(function(){
			$(this).stop().animate({ opacity: 0.5 }, 300, function(){
			});
			show_element('#reboot-pop-over');
		});
	
		$('#reboot-def').mouseleave(function(){
			$(this).stop().animate({ opacity: 1.0 }, 300, function(){
			});
			hide_element('#reboot-pop-over');
		});
	}
	
	if (is_touch_device()) {
		var PMO = $('#PMO-pop-over');
		var reboot = $('#reboot-pop-over');
		
		$('#PMO-def').on( 'click', function(){
			if (PMO.css('visibility', 'hidden')) {
				$(this).stop().animate({ opacity: 0.5 }, 300, function(){
				});
				show_element(PMO);
			}
			else {
				$(this).stop().animate({ opacity: 1.0 }, 300, function(){
				});
				hide_element(PMO);
			}
		});
		
		$('#reboot-def').on( 'click', function(){
			if (reboot.css('visibility', 'hidden')) {
				$(this).stop().animate({ opacity: 0.5 }, 300, function(){
				});
				show_element(reboot);
			}
		});
	}
};

$( document ).ready(ready);
$( document ).on('page:load', ready);