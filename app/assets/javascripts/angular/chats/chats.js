var chatsModule = angular.module('chatsModule', ['ngResource', 'ngAnimate', 'doowb.angular-pusher', 'luegg.directives']);

chatsModule
  .config(function($httpProvider){
		$httpProvider.defaults.transformRequest = function(data)
		{
			if (data === undefined) {
				return data;
			}
			var result = JSON.stringify(data);
			return result;
		}
});


chatsModule
	.config(['PusherServiceProvider',
	  function(PusherServiceProvider) {
	    PusherServiceProvider
	      .setToken(PUSHER_KEY)
	      .setOptions({ encrypted: true });
  }
]);