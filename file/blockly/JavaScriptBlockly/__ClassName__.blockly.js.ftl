(function() {
  'use strict';

  this.blockly = this.blockly || {};

  this.blockly.${ClassName} = this.blockly.${ClassName} || {};
  
  /**
   * @type blockly
   */
  this.blockly.${ClassName}.${FunctionName} = function(input) {
    return "INPUT" + input;
  };
  

}).bind(window)();