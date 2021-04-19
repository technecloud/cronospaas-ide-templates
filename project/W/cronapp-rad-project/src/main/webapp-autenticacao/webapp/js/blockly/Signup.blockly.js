window.blockly = window.blockly || {};
window.blockly.js = window.blockly.js || {};
window.blockly.js.blockly = window.blockly.js.blockly || {};
window.blockly.js.blockly.Signup = window.blockly.js.blockly.Signup || {};

/**
 * Signup
 */
window.blockly.js.blockly.Signup.SignupArgs = [{ description: 'signupUsername', id: 'ec5dbe32' }, { description: 'signupEmail', id: '62cce53e' }, { description: 'signupPassword', id: 'd42229ad' }, { description: 'signupConfirmPassword', id: 'a49023f3' }];
window.blockly.js.blockly.Signup.Signup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var item, statusCode, returnJson;
  if (await this.blockly.js.blockly.Signup.isValidSignup(signupUsername, signupEmail, signupPassword, signupConfirmPassword)) {
    this.cronapi.util.callServerBlocklyAsynchronous('blockly.UserManager:signUp', async function(sender_item) {
        item = sender_item;
      statusCode = this.cronapi.json.getProperty(returnJson, 'code');
      if (statusCode == '200') {
        this.cronapi.screen.notify('success',this.cronapi.i18n.translate("UserSuccessfullyRegistered",[  ]));
        this.cronapi.screen.changeView("#/home/login",[  ]);
      } else {
        this.cronapi.screen.notify('warning',this.cronapi.i18n.translate("UserNotRegistered",[  ]));
      }
    }.bind(this), signupUsername, signupEmail, signupPassword);
  }
}

/**
 * Descreva esta função...
 */
window.blockly.js.blockly.Signup.isValidSignupArgs = [{ description: 'signupUsername', id: 'abf7b641' }, { description: 'signupEmail', id: '38708282' }, { description: 'signupPassword', id: 'daf1486e' }, { description: 'signupConfirmPassword', id: '3f9f5d23' }];
window.blockly.js.blockly.Signup.isValidSignup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var isValid;
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
