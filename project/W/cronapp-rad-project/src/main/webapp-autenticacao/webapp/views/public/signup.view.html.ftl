<style title="local">
    .crn-button-signup-register {
        padding-left: 41px;
        padding-right: 41px;
    }

    .crn-anchor-signup-back {
        color: rgb(112, 112, 112);
        margin-top: 10px;
    }

    #buttonSave { 
        padding-right: 0px;
        float: right;
    }

    #buttonClose { 
        padding-right: 0px;
        float: right;
    }

</style>

<div class="bg">
    <div class="container-full">
        <div class="container-fluid" id="container-fluid">
            <div class="row component-holder siginPanel" id="component-holder">
                <div class="login-view col-sm-7 col-xs-10 col-lg-4 col-md-4">
                    <form class="form-validation ng-pristine ng-valid ng-valid-required" autocomplete="off" name="form" ng-submit="signup()" role="form">

                        <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-image" id="crn-image-signup">
                            <h1 class="text-center title component-holder titulo_card" xattr-position="h1 text-center"
                                xattr-type="h1" data-component="crn-text-component" id="crn-text-component-signup">
                                {{'Signup.view.Signup' | translate}}
                            </h1>
                        </div>

                        <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-signupemail">
                            <div class="form-group">
                                <label for="signupEmail" class="ng-binding">
                                    {{'Signup.view.Email' | translate}}
                                </label>
                                <input type="email" mask="" mask-placeholder="" ng-required="false"
                                       ng-model="signupEmail" id="signupEmail"
                                       class="form-control k-textbox ng-pristine ng-untouched ng-valid ng-empty ng-valid-required"
                                       placeholder="" autocomplete="email" autocorrect="off" autocapitalize="off">
                            </div>
                        </div>

                        <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-signupusername">
                            <div class="form-group">
                                <label for="signupUsername" class="ng-binding">
                                    {{'Signup.view.Username' | translate}}
                                </label>
                                <input type="text" mask="" mask-placeholder="" ng-required="false"
                                       ng-model="signupUsername" id="signupUsername"
                                       class="form-control k-textbox ng-pristine ng-untouched ng-valid ng-empty ng-valid-required"
                                       placeholder="" autocomplete="username" autocorrect="off" autocapitalize="off">
                            </div>
                        </div>

                        <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-signuppassword">
                            <div class="form-group">
                                <label for="signupPassword" class="ng-binding">
                                    {{'Users.view.Senha' | translate}}
                                </label>
                                <input type="password" mask="" mask-placeholder="" ng-required="false"
                                       ng-model="signupPassword" id="signupPassword"
                                       class="form-control k-textbox ng-pristine ng-untouched ng-valid ng-empty ng-valid-required"
                                       placeholder="" autocomplete="password" autocorrect="off" autocapitalize="off">
                            </div>
                        </div>

                        <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-signupconfirmpassword">
                            <div class="form-group">
                                <label for="signupConfirmPassword" class="ng-binding">
                                    {{'Users.view.ConfirmeSuaSenha' | translate}}
                                </label>
                                <input type="password" mask="" mask-placeholder="" ng-required="false"
                                       ng-model="signupConfirmPassword" id="signupConfirmPassword"
                                       class="form-control k-textbox ng-pristine ng-untouched ng-valid ng-empty ng-valid-required"
                                       placeholder="" autocomplete="confirm-password" autocorrect="off"
                                       autocapitalize="off">
                            </div>
                        </div>

                        <div class="component-holder ng-binding ng-scope col-md-12" data-component="crn-button">
                            <div class="messages">
                                <div ng-show="message.error" class="help-block ng-binding ng-hide" data-container="true">

                                </div>
                            </div>
                            <button role="button" aria-label="{{'Signup.view.Register' | translate}}"
                                    class="btn btn-default col-md-12 col-xs-12 k-button btn-primary crn-button-signup-register" type="submit"
                                    ng-disabled="form.$invalid || vm.dataLoading"
                                    ng-click="cronapi.client('js.blockly.Signup.Signup').names('signupUsername', 'signupEmail', 'signupPassword', 'signupConfirmPassword').run(signupUsername, signupEmail, signupPassword, signupConfirmPassword)"
                                    xattr-size="" xattr-fullsize="" xattr-theme="btn-default" xattr-disabled="" data-component="crn-button">
                                <span class="ng-binding">
                                    {{'Signup.view.Register' | translate}}
                                </span>
                            </button>
                            <a href="#/" class="cron-link component-holder col-md-12 col-xs-12 crn-anchor-signup-back" target="_self"
                               data-replace="true" data-component="crn-anchor" id="crn-anchor-signupback" style="text-align: center;">
                                {{'Signup.view.Back' | translate}}
                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="forgotPasswordModal"> 
  <div class="modal-dialog"> 
    <div class="modal-content"> 
      <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"> <span aria-hidden="true"> × </span> </button> 
        <h2 class="modal-title">{{'ForgotPassword' | translate}}</h2> 
      </div> 
      <div class="modal-body"> 
        <form class="form-validation" autocomplete="off" name="forgotPasswordForm" role="form">
        <div class="list-group list-group-sm"> 
            <div class="component-holder ng-scope" data-component="crn-textinput" id="crn-textinput-22942"> 
              <div class="form-group"> 
                <label for="input837">{{'ForgotPasswordEmail' | translate}}</label> 
                <input type="email" ng-required="true" ng-model="vars.inputResetPassword" class="form-control k-textbox" id="forgotPasswordEmail" aria-label="{{'EnterYourPassword' | translate}}" placeholder="{{'EnterYourPassword' | translate}}"> 
              </div> 
            </div> 
          </div> 
        </form> 
      </div> 
      <div class="modal-footer" > 
        <div class="component-holder ng-scope col-md-3 col-sm-3 col-xs-4 col-lg-3" data-component="crn-button" id="buttonSave"> 
          <button class="btn k-button crnCSS-default btn-success btn-block" type="submit" ng-click="forgotPassword()" ng-disabled="form.$invalid || vm.dataLoading" aria-label="{{'Save' | translate}}" xattr-fullsize="btn-block" xattr-theme="btn-success" xattr-disabled=""><i class="glyphicon glyphicon-ok"></i> <span>{{'Save' | translate}}</span></button> 
        </div> 
        <div class="component-holder ng-scope col-md-3 col-sm-3 col-xs-4 style1732  col-lg-3" data-component="crn-button" id="buttonClose"> 
          <button class="btn k-button crnCSS-default btn-danger btn-block" type="button" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}" xattr-fullsize="btn-block" xattr-theme="btn-danger" xattr-disabled=""><i class="glyphicon glyphicon-remove"></i> <span>{{'Home.view.Close' | translate}}</span></button> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>