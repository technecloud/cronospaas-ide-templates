app.controller('InspectorItemsController', ['PropertyManager','$scope', function(PropertyManager,$scope) {
  
  $scope.elementValue = "";
  
  PropertyManager.on('accept',function() {
    return $scope.elementValue;
  });
  
  PropertyManager.on('cancel',function() {
    alert("Cancel called");
  })
}]);