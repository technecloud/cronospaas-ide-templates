(function($app) {
    angular.module('custom.controllers', []);  

        app.controller('LoginController', ['$scope', '$http', '$location', '$rootScope',   function($scope, $http, $location, $rootScope){
        var vm = this;
        
        function login() {
            console.log('login');
            var user = { username: username.value, password: password.value };

            $http({
              method  : 'POST',
              url     : '/auth',
              data    : $.param(user),  // pass in data as strings
              headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
            }).then(handleSuccess, handleError('User or password invalid!'))
  
        }

        function handleSuccess(data) {
          vm.success = 'Success' ;
          vm.error = null;
          
          $rootScope.globals = {
            currentUser: username.value
          };

          $location.path('/page/home');
        }

        function handleError(error) {
          vm.error = error;
          vm.success = null;
        }

      
        vm.login = login;

    }]);  
    
    
      app.controller('HomeController', ['$scope', '$http', '$location','$rootScope',  function($scope, $http, $location, $rootScope){
        var vm = this;

        function logout(){
            console.log('logout');
            
              $http({
              method  : 'GET',
              url     : '/logout',
            }).then(handleSuccess, handleError('User or password invalid!'))
            
            $rootScope.globals.currentUser=undefined;

        }
        
          function handleSuccess(data) {
            $location.path('/login');
          }


          function handleError(error) {
            vm.error = error;
          }


        vm.username = $rootScope.globals.currentUser;
        vm.logout = logout;
        
      }]);
      
      
        app.controller('AdminController', ['$scope', '$http', '$location','$rootScope',  function($scope, $http, $location, $rootScope){
          var vm = this;
          
          vm.responses = [
                          {id: 400, name: 'Bad Request' }
                        , {id: 401, name: 'Unauthorized'}
                        , {id: 402, name: 'Payment Required'}
                        , {id: 403, name: 'Forbidden'}
                        , {id: 405, name: 'Method Not Allowed'}
                        , {id: 406, name: 'Not Acceptable'}
                        , {id: 501, name: 'Not implemented' }
                        , {id: 511, name: 'Network Authentication Required' }
                        ];
                        
          vm.verbs = [
                      {id: 'GET'    , name: 'GET'}
                    , {id: 'POST'   , name: 'POST'}
                    , {id: 'PUT'    , name: 'PUT'}
                    , {id: 'DELETE' , name: 'DELETE'}
                    , {id: 'OPTIONS', name: 'OPTIONS'}
                    , {id: 'HEAD'   , name: 'HEAD'}
                    , {id: 'TRACE'  , name: 'TRACE'}
                    , {id: 'CONNECT', name: 'CONNECT'}
                    , {id: 'ALL'    , name: 'ALL'}
                    ];      
          
          
          $scope.onStartInserting = function (){
              $rootScope.Permission.onStartInserting = function(){
                
                $rootScope.Permission.active.enabled = true;
                
              };    
          };

          function handleSuccess(data) {
            var UserRole = $scope.data.UserRole;
            UserRole.fetch();
          }


          function handleError(error) {
            vm.error = error;
          }

        }]);

    // Your code
}(app));
