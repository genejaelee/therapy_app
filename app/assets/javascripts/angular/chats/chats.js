var chatsModule = angular.module('chatsModule', ['ngResource']);

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