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
	
	$('.definition').click(function(){
		if(('#PMO-def').css('visibility', 'visible')){
			hide_element('#PMO-def');
		}
		else if (('#reboot-def').css('visibility', 'visible')){
			hide_element('#reboot-def');
		}
	});
};

$( document ).ready(ready);
$( document ).on('page:load', ready);