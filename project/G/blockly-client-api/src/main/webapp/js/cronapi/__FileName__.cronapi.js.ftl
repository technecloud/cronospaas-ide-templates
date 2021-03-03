(function() {
  'use strict';

  this.cronapi = this.cronapi || {};

   /**
   * @categoryName ${CategoryName}
   */
  this.cronapi.myfunctions = this.cronapi.myfunctions || {};
  
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