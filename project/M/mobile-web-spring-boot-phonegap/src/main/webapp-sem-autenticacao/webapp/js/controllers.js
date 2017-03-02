(function ($app) {
    angular.module('custom.controllers', []);
    
    app.controller('HomeController', ['$scope', '$http', '$rootScope', '$state', '$translate', 'Notification', function ($scope, $http, $rootScope, $state, $translate, Notification) {
        
        $scope.message = {};
        $scope.shouldShowDelete = false;
        $scope.shouldShowReorder = false;
        $scope.listCanSwipe = true
        
        
    }]);
} (app));