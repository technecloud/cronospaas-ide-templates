// Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'Cronos' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'custom.controllers' is found in js/controllers.js
// 'custom.dataset' is found in components/js/datasource.js
var app = (function() {
    return angular.module('MyApp', [
    'ui.router',
    'ngResource',
    'ngSanitize',
    'custom.controllers', 
    'custom.services',
    'custom.datasource',
    'chart.js',
	'ngMask'
    ])
    .config(function($stateProvider, $urlRouterProvider) {
        // Set up the states
        $stateProvider
        
          .state('login', {
            url: "/login",
            controller: 'LoginController',
            templateUrl: 'views/login.view.html'
          })
          
          .state('home', {
            url: "/home",
            controller: 'HomeController',
            templateUrl: 'views/logged/home.view.html'
          })

          .state('home.pages', {
            url: "/{name:.*}",
            controller: 'PageController',
            templateUrl: function(urlattr){
                return '/views/'+urlattr.name+'.view.html';
            }
          });
          
         // For any unmatched url, redirect to /state1
        $urlRouterProvider.otherwise("/login");
          
    })

    .directive('crnValue', ['$parse', function($parse) {
      return {
        restrict: 'A',
        require: '^ngModel',
        link: function(scope, element, attr, ngModel) {
            var evaluatedValue;
            if(attr.value) {
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

    // General controller
    .controller('PageController',["$scope",function(a){
      for(x in app.userEvents)
        a[x]= app.userEvents[x].bind(a);
    }]);

}(window));

app.userEvents = {};