var chatsModule = angular.module('chatsModule');

chatsModule.factory('PusherMethods', function() {
  return {
		pusher: function(){
			var socket = new Pusher(PUSHER_KEY, {
				encrypted: true
			});
			return socket;
		},
		
		channel: function(pusher){
			var thisChannel = pusher.subscribe('presence-' + channel);
			return thisChannel;
		},
		
		setAuthEndpoint: function(){
			Pusher.channel_auth_endpoint = '/api/authenticate?user_id=' + user_id;
		}
  };
});