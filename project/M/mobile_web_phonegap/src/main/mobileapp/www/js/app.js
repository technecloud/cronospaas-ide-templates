// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js

var app = (function() {
	return angular.module('starter', ['ionic', 'starter.controllers'])

	.run(function($ionicPlatform) {
		$ionicPlatform.ready(function() {
			// Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
			// for form inputs)
			if (window.cordova && window.cordova.plugins.Keyboard) {
				cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
				cordova.plugins.Keyboard.disableScroll(true);

			}
			if (window.StatusBar) {
				// org.apache.cordova.statusbar required
				StatusBar.styleDefault();
			}
		});
	})

	.directive('crnValue', ['$parse', function($parse) {
		return {
			restrict : 'A',
			require : '^ngModel',
			link : function(scope, element, attr, ngModel) {
				var evaluatedValue;
				if (attr.value) {
					evaluatedValue = attr.value;
				} else {
					evaluatedValue = $parse(attr.crnValue)(scope);
				}
				element.attr("data-evaluated", JSON.stringify(evaluatedValue));
				element.bind("click", function(event) {
					scope.$apply(function() {
						ngModel.$setViewValue(evaluatedValue);
					}.bind(element));
				});
			}
		};
	}])

	.config(function($stateProvider, $urlRouterProvider) {
		$stateProvider

		.state('app', {
			url : '/app',
			abstract : true,
			templateUrl : 'public/menu.view.html',
			controller : 'AppController'
		})

		.state('app.search', {
			url : '/search',
			views : {
				'menuContent' : {
					templateUrl : 'public/search.view.html'
				}
			}
		}).state('app.login', {
			url : '/login',
			views : {
				'menuContent' : {
					templateUrl : 'public/login.view.html'
				}
			}
		}).state('app.contactlist', {
			url : '/contactlist',
			views : {
				'menuContent' : {
					templateUrl : 'public/contactlist.view.html',
					controller : 'ContactListController'
				}
			}
		}).state('app.single', {
			url : '/contact/:contactId',
			views : {
				'menuContent' : {
					templateUrl : 'public/contact.view.html',
					controller : 'ContactController'
				}
			}
		}).state('404', {
        url: "/error/404",
        controller: 'AppController',
        templateUrl: function(urlattr){
            return 'views/error/404.view.html';
        }
      }).state('403', {
        url: "/error/403",
        controller: 'AppController',
        templateUrl: function(urlattr){
            return 'views/error/403.view.html';
        }
      });
      
     // For any unmatched url, redirect to /state1
     $urlRouterProvider.otherwise("/app/search");
	});
}(window));

app.userEvents = {};