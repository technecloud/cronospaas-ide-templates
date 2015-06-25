app.controller('InspectorDatasourceFieldController', ['PropertyManager','$scope','$rootScope', function(PropertyManager,$scope,$rootScope) {
  
  $scope.datasource = "";
  $scope.field = "";
  
  PropertyManager.on('open',function() {
    currentValue = PropertyManager.getCurrentValue();
    if(currentValue && currentValue.length > 0) {
      var parts = currentValue.split(".");
      if(parts.length >= 3 && parts[1] === "active") {
        $scope.datasource = parts[0];
        $scope.field = parts[2];
      }
    }
    
    
  });
  
  PropertyManager.on('accept',function(sourceElement) {
    return $scope.datasource + ".active." + $scope.field;
  });
  
  PropertyManager.on('cancel',function() {
  })
  
  $scope.selectDatasource = function() {
    $rootScope.currentDatasources.selected = $scope.datasource;
  }
}]);