app.controller('InspectorEventsController', ['PropertyManager','$scope', function(PropertyManager,$scope) {
  
  $scope.side = "";
  $scope.option = "";
  var eventName = "";
  

  
  PropertyManager.on('accept',function(currentObject) {
    var id = currentObject.closest(".component-holder").attr("id");


    var callback = function(data) {
      
      var script = document.createElement( 'script' );
      script.type = 'text/javascript';

      script.src = data.filePath;
      currentObject.closest('.view-content').append( script );
      
     currentObject.attr(eventName, data.filePath);
     
     
      PropertyManager.updateCode();
    };

    CronosHandler.processEvents(callback, $scope.side, $scope.option, eventName, id);
    
    return id.split("-").join("_") + "_" + eventName + "()";
  });
  
  PropertyManager.on('open',function(currentObject, propertyName, propertyValue) {
   eventName = propertyName;
  });  
  
  PropertyManager.on('cancel',function() {
  });
}]);