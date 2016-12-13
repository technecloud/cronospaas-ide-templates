(function ($app) {
    angular.module('custom.controllers', []);
    
    app.controller('HomeController', ['$scope', '$http', '$rootScope', '$state', '$translate', 'Notification', function ($scope, $http, $rootScope, $state, $translate, Notification) {
        
        $scope.message = {};

        $scope.vibrate = function() {
          try {
             $cordovaVibration.vibrate(1000);   
          } catch (err) {
            console.log('cordovaVibration.vibrate');
          }
        };

    }]);
} (app));