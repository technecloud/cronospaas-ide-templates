app.controller('TabItemsController', ['PropertyManager','$scope','$rootScope', function(PropertyManager,$scope,$rootScope) {
  
  $scope.items = [];
  $scope.newItem = "";
  $scope.active = "";
  var rootElement;
  
  
  PropertyManager.on('open',function(sourceElement) {
      $scope.items = [];
      rootElement = sourceElement.closest( ".component-holder" ).clone();
      rootElement.find( "div[role='tabpanel']" ).each(function() {
        var id = $( this ).attr("id");
        $scope.items.push( id );
      });
      
      $scope.active = rootElement.find( "li.active a" );
      if($scope.active.size() > 0) {
        $scope.active = $scope.active.attr( "data-target" ).replace( "#", "" );
      } else {
        $scope.active = "";
      }
      
  });
  
  PropertyManager.on('accept',function(sourceElement) {

    sourceElement.closest(".component-holder").replaceWith( rootElement );
    
    // Set active
    rootElement.find( "li[role='presentation']" ).removeClass( "active" );
    rootElement.find( "a[data-target='#"+ $scope.active +"']" ).closest( "li" ).addClass( "active" );
      
    return "";
  });
  
  PropertyManager.on('cancel',function() {
    $scope.items = [];
    $scope.newItem = null;
    $scope.active = null;
    rootElement = null;
  });
  
  $scope.addItem = function() {
    
    var item = $scope.newItem;
    
    rootElement.find("ul[role='tablist']").append("<li role=\"presentation\"><a data-target=\"#"+ item +"\" role=\"tab\" data-toggle=\"tab\">Tab #"+item+"</a></li>");
    rootElement.find(".tab-content").append("<div role=\"tabpanel\" class=\"tab-pane\" id=\""+ item +"\"><div data-container=\"true\" class=\"\"></div></div>");
        
    $scope.items.push(item);
    $scope.newItem = "";
  };
  
  $scope.removeItem = function(itemID) {
    rootElement.find("a[data-target='#"+ itemID +"']").remove();
    rootElement.find("#"+ itemID).remove();
    
    for(var i = 0; i < $scope.items.length; i++) {
      if($scope.items[i] === itemID) {
        $scope.items.splice(i,1);
        break;
      }
    }
  };
  
  $scope.moveUp = function(index) {
    move(index - 1, index);
  }
  
  $scope.moveDown = function(index) {
    move(index + 1, index);
  }
  
  var move = function(new_index, old_index) {
    var arr = $scope.items; 
    if (new_index >= arr.length) {
        var k = new_index - arr.length;
        while ((k--) + 1) {
            arr.push(undefined);
        }
    }
    arr.splice(new_index, 0, arr.splice(old_index, 1)[0]);
    
  }
  
}]);