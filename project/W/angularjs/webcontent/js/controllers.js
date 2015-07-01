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
          
          function addUserToRole(){
            
            var activeUser = $scope.data.User.active;
            var activeRole = $scope.data.Role.active;

            console.log("addUserToRole", $scope);
            
//            var userRole = { user: {id: activeUser.id }, role: { id: activeRole.id } };
            // $http({
            //   method  : 'POST',
            //   url     : '/api/rest/UserRole',
            //   data    : $.param(userRole),  // pass in data as strings
            //   headers : { 'Content-Type': 'application/json' }  // set the headers so angular passing info as form data (not request payload)
            // }).then(handleSuccess, handleError('User or password invalid!'))

            var userRole = { userId: activeUser.id, roleId: activeRole.id };
            $http({
              method  : 'POST',
              url     : '/api/rest/UserRole',
              data    : $.param(userRole),  // pass in data as strings
              headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
            }).then(handleSuccess, handleError);

          }
          function addAllUserToRole(){
            console.log("addAllUserToRole", $scope);
          }
          
          function handleSuccess(data) {
//            vm.success = data;
            
            var UserRole = $scope.data.UserRole;
            UserRole.fetch();
          }


          function handleError(error) {
            vm.error = error;
          }

          
          vm.addUserToRole = addUserToRole;
          vm.addAllUserToRole = addAllUserToRole;

        }]);

      
      
    // Your code
}(app));
