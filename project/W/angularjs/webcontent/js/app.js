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
        $routeProvider
        
        .when('/page/login', {
            controller: 'LoginController',
            templateUrl: 'views/login.view.html',
            controllerAs: 'vm'
        })

        .when('/page/home', {
            controller: 'HomeController',
            templateUrl: 'views/logged/home.view.html',
            controllerAs: 'vm'
        })

        .when('/page/admin', {
            controller: 'AdminController',
            templateUrl: 'views/admin/admin.view.html',
            controllerAs: 'vm'
        })
      
        .when('/page/:name*', {
            templateUrl: function(urlattr){
                return '/views/' + urlattr.name + '.view.html';
            },
            controller: 'GeneralController'
        })
        
        // Default route
        .otherwise({
            redirectTo: '/page/login'
        });
    }])

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
    .controller("GeneralController",["$scope",function(a){
      for(x in app.userEvents)
        a[x]= app.userEvents[x].bind(a);
        
    }]);

}(window));