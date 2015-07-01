app.controller('TabsActiveItemController', ['$scope', 'PropertyManager', function($scope, PropertyManager) {
  $scope.items = [];
  $scope.newItem = "";
  $scope.active = "";
  var rootElement;
  
  var pm = PropertyManager.get("active");
  
  pm.on('open', function(sourceElement, propertyName, propertyValue) {
      $scope.items = [];
      rootElement = sourceElement.closest( ".component-holder" );
      rootElement.find( "div[role='tabpanel']" ).each(function() {
        var id = $( this ).attr("id");
        $scope.items.push( { 'key' : id, value : $('a[data-target="#'+ id +'"]').html() });
      });
      
      $scope.active = rootElement.find( "li.active a" );
      if($scope.active.size() > 0) {
        $scope.active = $scope.active.attr( "data-target" ).replace( "#", "" );
      } else {
        $scope.active = "";
      }
      
  });
  
  pm.on('accept', function(sourceElement) {
    // Set active
    sourceElement.find( "li[role='presentation']" ).removeClass( "active" );
    sourceElement.find( "a[data-target='#"+ $scope.active +"']" ).closest( "li" ).addClass( "active" );
    
    sourceElement.closest(".component-holder").find('.tab-pane').removeClass("active");
    sourceElement.closest(".component-holder").find('#'+ $scope.active).addClass("active");
    
    return "[tab: #" + $scope.active + "]";
  });
  
  pm.on('cancel', function() {
    $scope.items = [];
    $scope.newItem = null;
    $scope.active = null;
    rootElement = null;
  });
}]);