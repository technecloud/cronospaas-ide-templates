(function($app) {
    $app.directive('crnDatasource',['DatasetManager', function(DatasetManager) {
      return {
        restrict: 'E',
        templateUrl: "components/templates/table.template.html",
        controller: 'CrnFormController',
        controllerAs: "TableCtrl",
        scope: {
            crnDatasource : '@'
        }
      };
    }])

    .controller("CrnFormController",['DatasetManager', '$scope', function(DatasetManager, $scope) {
        $scope.data = DatasetManager.datasets;
        $scope.datasource = $scope.data[$scope.crnFormSource];
    }]);
}(app));