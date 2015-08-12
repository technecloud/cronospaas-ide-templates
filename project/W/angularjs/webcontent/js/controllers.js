(function($app) {
    angular.module('custom.controllers', []);  

        app.controller('LoginController', ['$scope', '$http', '$location', '$rootScope', '$window',  function($scope, $http, $location, $rootScope, $window){
        var vm = this;
        
        console.log('login.controller');
        
        function login() {
            console.log('login');
            var user = { username: username.value, password: password.value };

            $http({
              method  : 'POST',
              url     : '/auth',
              data    : $.param(user),  // pass in data as strings
              headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
            }).success(handleSuccess).error(handleError);

        }
        
        function handleSuccess(data, status, headers, config) {
          vm.success = 'Success' ;
          vm.error = null;
          vm.username = username.value;
          
          $rootScope.globals = {
            currentUser: username.value
          };

          $location.path('/home');
        }

        function handleError(data, status, headers, config) {
          var error = status == 401 ? "Username or passoword invalid!" : data ; 
          vm.error = error;
          vm.success = null;
        }
        
        function goto(path){
          $window.location.href=path;
        }
      
        vm.login = login;
        vm.goto  = goto;

    }]);  
    
    
      app.controller('HomeController', ['$scope', '$http', '$location','$rootScope','$state', function($scope, $http, $location, $rootScope,$state){
        var vm = this;

        function logout(){
            console.log('logout');
            
              $http({
              method  : 'GET',
              url     : '/logout',
            }).then(handleSuccess, handleError('User or password invalid!'))
            
            vm.username = undefined;
        }
        
          function handleSuccess(data) {
            $location.path('/login');
          }


          function handleError(error) {
            vm.error = error;
          }

          function handleSession(response){
            console.log("handleSession", response);
            for (var key in response.data) {
                if (response.data.hasOwnProperty(key)) {
                    vm[key] = response.data[key];
                }
            }
            vm.username = response.data.name;
            vm.userpictureurl = response.data.picture;
          }

          $http({
            method  : 'GET',
            url     : '/session',
          }).then(handleSession)


          vm.logout = logout;
        
      }]);
      
      
        app.controller('AdminController', ['$scope', '$http', '$location','$rootScope',  function($scope, $http, $location, $rootScope){
          var vm = this;
          
          console.log('AdminController');
          
          vm.responses = [
                          {id: 200, name: 'OK' }
                        , {id: 201, name: 'Created' }
                        , {id: 400, name: 'Bad Request' }
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
                $rootScope.Permission.active.priority = 0;
                
              };    
          };

          function handleSuccess(data) {
            var UserRole = $scope.data.UserRole;
            UserRole.fetch();
          }


          function handleError(error) {
            vm.error = error;
          }
          
          function handleSession(response){
            console.log("handleSession", response);
            vm.username = response.data.username;
          }

          $http({
            method  : 'GET',
            url     : '/session',
          }).then(handleSession)


        }]);

    // Your code
}(app));
