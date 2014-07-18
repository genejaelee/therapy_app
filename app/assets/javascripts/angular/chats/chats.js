var chatsModule = angular.module('chatsModule', ['ngResource']);

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

chatsModule.directive('ngEnter', function() {
return function(scope, element, attrs) {
    element.bind("keydown keypress", function(event) {
      if(event.which === 13) {
				if (scope.$root.$$phase != '$apply' && scope.$root.$$phase != '$digest') {
	        scope.$apply(function(){
	          scope.$eval(attrs.ngEnter, {'event': event});
	        });
	        event.preventDefault();
				}
      }
    });
  };
});