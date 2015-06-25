app.controller('InspectorEventsController', ['PropertyManager','$scope', function(PropertyManager,$scope) {
  
  $scope.side = "";
  $scope.option = "";
  var eventName = "";
  
  var callback = function(data) {
  };
  
  PropertyManager.on('accept',function(currentObject) {
    var id = currentObject.closest(".component-holder").attr("id");
    CronosHandler.processEvents(callback, $scope.side, $scope.option, eventName, id);
    
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = 'views/events/Pessoa_server.js';
    currentObject.closest('.view-content').append( script );
    
    return id.split("-").join("_") + "_" + eventName + "()";
  });
  
  PropertyManager.on('open',function(currentObject, propertyName, propertyValue) {
   eventName = propertyName;
  });  
  
  PropertyManager.on('cancel',function() {
  });
}]);