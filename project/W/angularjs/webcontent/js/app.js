// Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'Cronos' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'custom.controllers' is found in js/controllers.js
// 'custom.dataset' is found in components/js/datasource.js
var app = (function() {
    return angular.module('MyApp', [
		'ngRoute',
		'ngResource',
		'ngSanitize',
	    'custom.controllers', 
		'custom.services',
	    'custom.datasource'
    ])
    .config(['$routeProvider', function($routeProvider) {
  	    // Route
        $routeProvider.
          when('/home', {
            templateUrl: 'views/home.view.html',
        }).
    
        // Default route
         otherwise({
            redirectTo: '/home'
         });
    }]);
}(window));