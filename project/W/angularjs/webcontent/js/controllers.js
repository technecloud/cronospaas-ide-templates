(function($app) {
    angular.module('custom.controllers', []);  

      app.controller('LoginController', ['$scope', '$http', '$location', '$rootScope', '$window',  function($scope, $http, $location, $rootScope, $window){

        $scope.message = {};
        
        $scope.login = function () {
            $scope.message.error = undefined;

            var user = { username: username.value, password: password.value };

            $http({
              method  : 'POST',
              url     : '/auth',
              data    : $.param(user),  
              headers : { 'Content-Type': 'application/x-www-form-urlencoded' } 
            }).success(handleSuccess).error(handleError);

        }
        
        $scope.goto = function(path){
          $window.location.href=path;
        }
        
        function handleSuccess(data, status, headers, config) {
          $location.path('/home');
        }

        function handleError(data, status, headers, config) {
          var error = status == 401 ? "Username or passoword invalid!" : data ; 
          $scope.message.error = error;
        }
    }]);  
    
    
    app.controller('HomeController', ['$scope', '$http', '$location','$rootScope','$state', function($scope, $http, $location, $rootScope,$state){
      $rootScope.session = {};

      $rootScope.logout = function logout() {

          $http({
            method  : 'GET',
            url     : '/logout',
          }).then(handleSuccess, handleError('User or password invalid!'))
          
          $rootScope.session = {};
      }
      
        function handleSuccess(data) {
          $location.path('/login');
        }


        function handleError(error) {
          $rootScope.session.error = error;
        }

        function handleSession(response){
          $rootScope.session = response.data;
        }

        $http({
          method  : 'GET',
          url     : '/session',
        }).then(handleSession)

    }]);
    
    // Your code
}(app));
