(function($app) {
  
  $app.directive('crnCombobox', ['$timeout','$rootScope',  function($timeout,$rootScope) {
    return {
      restrict: 'A',
      require:"ngModel",
      scope: true,
      link: function(scope, element, attr, ngModel){
          if(ngModel) {
             scope.$watch(function(){
                   return ngModel.$modelValue;
              }, function(modelValue){
                if (modelValue) {
                    scope.selectedItem = "";
                    element.find("li").each(function() {
                      var current = $(this);
                      var evaluatedValue = (current.attr("data-evaluated")) ? JSON.parse(current.attr("data-evaluated")) : {};
                      var diff = false;
                      for(var key in modelValue) {
                        if(modelValue.hasOwnProperty(key) && key.indexOf("$") !== 0) {
                          if(!evaluatedValue[key] || evaluatedValue[key] != modelValue[key]) {
                            diff = true;
                            break;
                          }
                        }
                      }
                      
                      if(!diff) 
                        scope.selectedItem = current.text();
                    });
                }
              });
              
              attr.$observe('filter', function(value){
                scope.filter = value;
              });
              
              scope.datasourceName = attr.crnDatasource;
          }
      },
      controller: function($scope) {
        $scope.selectedItem = "";
        $scope.searchTerm = null;
        $scope.datasourceName = "";
        $scope.filter = "";
        
        var timeoutPromise;
  
        this.setSelected = function(value) {
          $scope.selectedItem = value;
        };
        
        $scope.startSearching = function($event) {
          $event.preventDefault();
          $event.stopPropagation();
        };
        
        $scope.nextPage = function($event) {
          $event.preventDefault();
          $event.stopPropagation();
          $rootScope[$scope.datasourceName].nextPage();
        };
        
        $scope.prevPage = function($event) {
          $event.preventDefault();
          $event.stopPropagation();
          $rootScope[$scope.datasourceName].prevPage();
        };
        
        $scope.hasMorePages = function() {
          return $rootScope[$scope.datasourceName].hasNextPage();
        };
        
        $scope.doSearch = function() {
          // Stop the pending timeout
          $timeout.cancel(timeoutPromise);
          
          // Start a timeout
          timeoutPromise = $timeout(function() {
             if($scope.filter) {
               $rootScope[$scope.datasourceName].filter($scope.filter);
             }
          }, 500);

        };
      }
    };
  }]);
  
}(app));