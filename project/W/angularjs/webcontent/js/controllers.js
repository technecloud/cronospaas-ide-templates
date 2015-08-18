(function ($app) {
    angular.module('custom.controllers', []);

    app.controller('LoginController', ['$scope', '$http', '$location', '$rootScope', '$window', '$state', function ($scope, $http, $location, $rootScope, $window, $state) {

        $scope.message = {};

        $scope.login = function () {

            $scope.message.error = undefined;

            var user = { username: username.value, password: password.value };

            $http({
                method: 'POST',
                url: '/auth',
                data: $.param(user),
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            }).success(handleSuccess).error(handleError);
        }

        function handleSuccess(data, status, headers, config) {

            function handleSession(response) {
                $rootScope.session = response.data;
                $state.go('home');
            }

            $http({
                method: 'GET',
                url: '/session',
            }).then(handleSession)
        }

        function handleError(data, status, headers, config) {
            var error = status == 401 ? "Username or passoword invalid!" : data;
            $scope.message.error = error;
        }
    }]);

    app.controller('HomeController', ['$scope', '$http', '$location', '$rootScope', '$state', function ($scope, $http, $location, $rootScope, $state) {

        $rootScope.logout = function logout() {

            $http({
                method: 'GET',
                url: '/logout',
            }).then(handleSuccess, handleError('User or password invalid!'))

            $rootScope.session = {};
        }

        function handleSuccess(data) {
            $location.path('/login');
        }


        function handleError(error) {
            $rootScope.session.error = error;
        }
    }]);
} (app));
