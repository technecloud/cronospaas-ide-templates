app.controller('InspectorDatasourceFieldController', ['PropertyManager','$scope','$rootScope', function(PropertyManager,$scope,$rootScope) {
  
  $scope.datasource = "";
  $scope.field = "";
  
  var pm =  PropertyManager.get("ng-model");
  
  pm.on('open',function() {
    currentValue = pm.getCurrentValue();
    if(currentValue && currentValue.length > 0) {
      var parts = currentValue.split(".");
      if(parts.length >= 3 && parts[1] === "active") {
        $scope.datasource = parts[0];
        $scope.field = parts[2];
      }
    }
    
    
  });
  
  pm.on('accept',function(sourceElement) {
    return $scope.datasource + ".active." + $scope.field;
  });
  
  pm.on('cancel',function() {
  })
  
  $scope.selectDatasource = function() {
    $rootScope.currentDatasources.selected = $scope.datasource;
  }
}]);