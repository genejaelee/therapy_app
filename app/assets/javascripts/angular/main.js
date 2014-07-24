var mainApp = angular.module('mainApp', ['chatsModule', 'therapistsModule', 'usersModule', 'ngResource']);

mainApp.config(function($httpProvider) {
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});