window.blockly = window.blockly || {};
window.blockly.js = window.blockly.js || {};
window.blockly.js.blockly = window.blockly.js.blockly || {};
window.blockly.js.blockly.auth = window.blockly.js.blockly.auth || {};
window.blockly.js.blockly.auth.Signup = window.blockly.js.blockly.auth.Signup || {};

/**
 * Signup
 */
window.blockly.js.blockly.auth.Signup.SignupArgs = [{ description: 'signupUsername', id: '8df902ea' }, { description: 'signupEmail', id: '0c25d725' }, { description: 'signupPassword', id: '9c203fbf' }, { description: 'signupConfirmPassword', id: '067b073b' }];
window.blockly.js.blockly.auth.Signup.Signup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var returnJson, statusCode;
  if (await this.blockly.js.blockly.auth.Signup.isValidSignup(signupUsername, signupEmail, signupPassword, signupConfirmPassword)) {
    this.cronapi.util.callServerBlocklyAsynchronous('blockly.UserManager:signUp', async function(sender_returnJson) {
        returnJson = sender_returnJson;
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
window.blockly.js.blockly.auth.Signup.isValidSignupArgs = [{ description: 'signupUsername', id: 'be2325de' }, { description: 'signupEmail', id: 'dc667925' }, { description: 'signupPassword', id: '9a49950f' }, { description: 'signupConfirmPassword', id: 'f6fdc12c' }];
window.blockly.js.blockly.auth.Signup.isValidSignup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
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
