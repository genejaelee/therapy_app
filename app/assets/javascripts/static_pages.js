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
		$('#PMO-pop-over').stop().animate( {opacity : 1 },  300, function(){
		});
		$('#PMO-pop-over').css('visibility', 'visible');
	});
	
	$('#PMO-def').mouseleave(function(){
		$(this).stop().animate({ opacity: 1.0 }, 300, function(){
		});
		$('#PMO-pop-over').stop().animate( {opacity : 0 }, 300, function(){
			$('#PMO-pop-over').css('visibility', 'hidden');
		});
	});
	$('#reboot-def').mouseover(function(){
		$(this).stop().animate({ opacity: 0.5 }, 300, function(){
		});
		$('#reboot-pop-over').stop().animate( {opacity : 1 }, 300, function(){
		});
	});
	
	$('#reboot-def').mouseleave(function(){
		$(this).stop().animate({ opacity: 1.0 }, 300, function(){
		});
		$('#reboot-pop-over').stop().animate( {opacity : 0 }, 300, function(){
		});
	});
};

$( document ).ready(ready);
$( document ).on('page:load', ready);