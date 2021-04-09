window.blockly = window.blockly || {};
window.blockly.js = window.blockly.js || {};
window.blockly.js.blockly = window.blockly.js.blockly || {};
window.blockly.js.blockly.auth = window.blockly.js.blockly.auth || {};
window.blockly.js.blockly.auth.Signup = window.blockly.js.blockly.auth.Signup || {};

/**
 * Signup
 */
window.blockly.js.blockly.auth.Signup.SignupArgs = ['signupUsername', 'signupEmail', 'signupPassword', 'signupConfirmPassword'];
window.blockly.js.blockly.auth.Signup.Signup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var item;
  if (await this.blockly.js.blockly.auth.Signup.isValidSignup(signupUsername, signupEmail, signupPassword, signupConfirmPassword)) {
    this.cronapi.util.callServerBlocklyAsynchronous('blockly.SignupApp:signupApp', async function(sender_item) {
        item = sender_item;
      this.cronapi.screen.changeView("#/app/login",[  ]);
    }.bind(this), signupUsername, signupEmail, signupPassword);
  }
}

/**
 * Descreva esta função...
 */
window.blockly.js.blockly.auth.Signup.isValidSignupArgs = ['signupUsername', 'signupEmail', 'signupPassword', 'signupConfirmPassword'];
window.blockly.js.blockly.auth.Signup.isValidSignup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var item;
  isValid = true;
  if (this.cronapi.logic.isNullOrEmpty(signupUsername)) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("UsernameCanNotBeEmpty",[  ]));
    isValid = false;
  }
  if (this.cronapi.logic.isNullOrEmpty(signupEmail)) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("EmailCanNotBeEmpty",[  ]));
    isValid = false;
  }
  if (this.cronapi.logic.isNullOrEmpty(signupPassword)) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("PasswordCanNotBeEmpty",[  ]));
    isValid = false;
  }
  if (this.cronapi.logic.isNullOrEmpty(signupConfirmPassword)) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("PasswordConfirmationCanNotBeEmpty",[  ]));
    isValid = false;
  }
  if (signupPassword != signupConfirmPassword) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("PasswordDoesNotMatch",[  ]));
    isValid = false;
  }
  return isValid;
}
