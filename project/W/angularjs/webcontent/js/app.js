var app = (function() {
    return angular.module('MyApp', [
    'ui.router',
    'ui.select',
    'ngResource',
    'ngSanitize',
    'custom.controllers', 
    'custom.services',
    'custom.datasource',
    'chart.js',
	  'ngMask',
    'ngJustGage'
    ])
    .config(function($stateProvider, $urlRouterProvider) {
        // Set up the states
        $stateProvider
          
          .state('login', {
            url: "",
            controller: 'LoginController',
            templateUrl: 'views/login.view.html'
          })
          
          .state('main', {
            url: "/",
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
                return 'views/'+urlattr.name+'.view.html';
            }
          }) 
          
          .state('404', {
            url: "/error/404",
            controller: 'PageController',
            templateUrl: function(urlattr){
                return 'views/error/404.view.html';
            }
          })
          
          .state('403', {
            url: "/error/403",
            controller: 'PageController',
            templateUrl: function(urlattr){
                return 'views/error/403.view.html';
            }
          });
          
         // For any unmatched url, redirect to /state1
         $urlRouterProvider.otherwise("/error/404");
          
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
    .controller('PageController',["$scope","$stateParams",function(a,$stateParams){
      for(var x in app.userEvents)
        a[x]= app.userEvents[x].bind(a);
        a.params = $stateParams;
    }])
    
    .run(function($rootScope,$state) {
      $rootScope.$on('$stateChangeError', function() {
        if(arguments.length >= 6) {
          var requestObj = arguments[5];
          if(requestObj.status === 404 || requestObj.status === 403) {
            $state.go(requestObj.status.toString()); 
          }
        } else {
          $state.go('404');
        }
      });
    });

}(window));

app.userEvents = {};