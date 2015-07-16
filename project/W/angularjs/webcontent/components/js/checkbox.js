(function($app) {
  
  $app.directive('crnCombobox', ['$parse',  function($parse) {
    return {
      restrict: 'A',
      require:"ngModel",
      link: function(scope, element, attr, ngModel){
          
          if(ngModel) {
             scope.$watch(function(){
                   return ngModel.$modelValue;
              }, function(modelValue){
                if (modelValue) {
                    scope.selectedItem = "";
                    element.find("li").each(function() {
                      var current = $(this);
                      var evaluatedValue = JSON.parse(current.attr("data-evaluated"));
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
          }
      },
      controller: function($scope) {
        $scope.selectedItem = "";
  
        this.setSelected = function(value) {
          $scope.selectedItem = value;
        }
      }
    };
  }]);

  $app.controller("myController",['$scope',function($scope) {
    $scope.Pessoa = "2";
  }])
  
}(app));