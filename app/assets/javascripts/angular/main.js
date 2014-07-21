var mainApp = angular.module('mainApp', ['chatsModule', 'therapistsModule', 'ngResource']);

mainApp.config(function($httpProvider) {
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});