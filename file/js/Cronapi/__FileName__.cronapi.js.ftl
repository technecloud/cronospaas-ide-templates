(function() {
  'use strict';

  this.cronapi = {};

   /**
   * @categoryName ${CategoryName}
   */
  this.cronapi.myfunctions = {};
  
  /**
   * @type function
   * @name ${FunctionName}
   * @description ${Description}
   * @multilayer false
   * @param {ObjectType.STRING} input Param Description
   * @returns {ObjectType.STRING}
   */
  this.cronapi.myfunctions.${ReducedFunctionName} = function(/** @type {ObjectType.STRING} @description ${InputDescription} */input) {
    return "INPUT" + input;
  };
  

}).bind(window)();