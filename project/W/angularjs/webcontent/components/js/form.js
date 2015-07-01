(function($app) {
    $app.directive('crnDatasource',['DatasetManager', function(DatasetManager) {
      return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            scope.data = DatasetManager.datasets;
            scope.datasource = scope.data[attrs.crnDatasource];
        }
      };
    }]);
}(app));