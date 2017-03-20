(function ($app) {
    angular.module('custom.controllers', []);
    
    app.controller('HomeController', ['$scope', '$http', '$rootScope', '$state', '$translate', 'Notification', function ($scope, $http, $rootScope, $state, $translate, Notification) {
      $rootScope.http = $http;

      for(var x in app.userEvents)
          $scope[x]= app.userEvents[x].bind($scope);
        $scope.message = {};
        $scope.shouldShowDelete = false;
        $scope.shouldShowReorder = false;
        $scope.listCanSwipe = true
        
        
    }]);
} (app));