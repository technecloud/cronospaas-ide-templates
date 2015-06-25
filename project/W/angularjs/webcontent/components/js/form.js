(function($app) {
    $app.directive('crnDatasource',['DatasetManager', function(DatasetManager) {
      return {
        restrict: 'A',
        controller: 'CrnFormController',
        link: function(scope, element, attrs) {
            scope.data = DatasetManager.datasets;
            scope.datasource = scope.data[attrs.crnDatasource];
        }
      };
    }])

    .controller("CrnFormController",['DatasetManager', '$scope', function(DatasetManager, $scope) {
        $scope.funcione = function() {
          $scope.datasource.startInserting();
        }
        
    }]);
}(app));