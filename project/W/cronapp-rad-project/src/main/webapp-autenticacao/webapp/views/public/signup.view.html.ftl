<style title="local">
    .crn-button-signup-register {
        padding-left: 41px;
        padding-right: 41px;
    }

    .crn-anchor-signup-back {
        color: rgb(112, 112, 112);
        margin-top: 10px;
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
