window.blockly = window.blockly || {};
window.blockly.js = window.blockly.js || {};
window.blockly.js.blockly = window.blockly.js.blockly || {};
window.blockly.js.blockly.UserControl = window.blockly.js.blockly.UserControl || {};

/**
 * Descreva esta função...
 */
window.blockly.js.blockly.UserControl.resetPasswordArgs = [{ description: 'email', id: '7afdf898' }];
window.blockly.js.blockly.UserControl.resetPassword = async function(email) {
 var signupUsername, signupEmail, signupPassword, signupConfirmPassword, returnJson;
  if (this.cronapi.logic.isNullOrEmpty(email)) {
    this.cronapi.screen.notify('error',this.cronapi.i18n.translate("EmailCanNotBeEmpty",[  ]));
  } else {
    this.cronapi.util.callServerBlocklyAsynchronous('blockly.UserControl:resetPassword', async function(sender_item) {
        item = sender_item;
      this.cronapi.screen.notify('success',this.cronapi.i18n.translate("ForgotPasswordSent",[  ]));
    }.bind(this), email);
  }
}

/**
 * Signup
 */
window.blockly.js.blockly.UserControl.signUpArgs = [{ description: 'signupUsername', id: 'ec5dbe32' }, { description: 'signupEmail', id: '62cce53e' }, { description: 'signupPassword', id: 'd42229ad' }, { description: 'signupConfirmPassword', id: 'a49023f3' }];
window.blockly.js.blockly.UserControl.signUp = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var returnJson, httpStatus;
  if (await this.blockly.js.blockly.UserControl.isValidSignup(signupUsername, signupEmail, signupPassword, signupConfirmPassword)) {
    this.cronapi.util.callServerBlocklyAsynchronous('blockly.UserControl:signUp', async function(sender_returnJson) {
        returnJson = sender_returnJson;
      console.log(returnJson);
      httpStatus = this.cronapi.json.getProperty(this.cronapi.json.createObjectFromString(returnJson), 'code');
      if (httpStatus == '200') {
        this.cronapi.screen.notify('success',this.cronapi.i18n.translate("UserSuccessfullyRegistered",[  ]));
        this.cronapi.screen.changeView("#/app/login",[  ]);
      } else {
        this.cronapi.screen.notify('warning',this.cronapi.i18n.translate("UserNotRegistered",[  ]));
      }
    }.bind(this), signupUsername, signupEmail, signupPassword);
  }
}

/**
 * Descreva esta função...
 */
window.blockly.js.blockly.UserControl.isValidSignupArgs = [{ description: 'signupUsername', id: 'abf7b641' }, { description: 'signupEmail', id: '38708282' }, { description: 'signupPassword', id: 'daf1486e' }, { description: 'signupConfirmPassword', id: '3f9f5d23' }];
window.blockly.js.blockly.UserControl.isValidSignup = async function(signupUsername, signupEmail, signupPassword, signupConfirmPassword) {
 var returnJson, httpStatus;
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
