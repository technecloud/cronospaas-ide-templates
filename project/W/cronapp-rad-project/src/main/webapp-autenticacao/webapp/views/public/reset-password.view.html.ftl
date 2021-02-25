<div class="bg">
  <div class="container-full" data-container="true">
    <div class="container-fluid" data-container="true">
      <div class="row component-holder">
        <div class="col-xs-12 col-sm-3 col-lg-4" data-container="true"></div>
        <div class="col-xs-12 col-sm-6 col-lg-4 login-panel login-view" data-container="true">
          <form class="form-validation" autocomplete="off" name="form" ng-submit="resetPassword()" role="form">
            <input type="hidden" name="csrf_token" value="CIwNZNlR4XbisJF39I8yWnWX9wX4WFoz">
            <div class="text-danger wrapper text-center" ng-show="authError"></div>
            <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-image" id="crn-image-823921">
              <h1>
                <img alt="Cronapp" src="node_modules/cronapp-framework-js/img/cronapp-logo-login.png" class="" style="display:block; width:60%; height:auto; margin-left:auto; margin-right:auto;" xattr-position="margin-left:auto; margin-right:auto;" data-component="crn-image">
              </h1>
            </div>
            <div class="col-xs-10 col-md-8 col-md-push-2 col-xs-push-1" data-container="true">
              <ul class="list-inline center-block text-center">
                <h2 class="text-center title component-holder col-xs-12 col-md-12" xattr-position="h1 text-center" xattr-type="h1" data-component="crn-text-component" id="crn-text-component-814180">{{'ResetPassword' | translate}}</h2>
              </ul>
            </div>
            <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-283724">
              <div class="form-group">
                <label for="passwordNew">{{'ResetPasswordNew' | translate}}</label>
                <input type="password" mask="" mask-placeholder="" ng-required="false" ng-model="passwordNew" class="form-control k-textbox" id="passwordNew" placeholder="" autocorrect="off" autocapitalize="off">
              </div>
            </div>
            <div class="component-holder ng-binding ng-scope col-xs-12 col-md-12" data-component="crn-textinput" id="crn-textinput-343947">
              <div class="form-group">
                <label for="passwordConfirmation">{{'ResetPasswordConfirmation' | translate}}</label>
                <input type="password" mask="" mask-placeholder="" ng-required="false" ng-model="passwordConfirmation" class="form-control k-textbox" id="passwordConfirmation" placeholder="">
              </div>
            </div>
            <div class="component-holder ng-binding ng-scope col-md-12" data-component="crn-button">
              <button role="button" aria-label="{{'ResetPassword' | translate}}" class="btn btn-default col-md-12 col-xs-12 k-button btn-primary" type="submit" ng-disabled="form.$invalid || vm.dataLoading" ng-click="" xattr-size="" xattr-fullsize="" xattr-theme="btn-default" xattr-disabled="" data-component="crn-button">
                <span>{{'ResetPassword' | translate}}</span>
              </button>
            </div>
          </form>
        </div>
        <div class="component-holder ng-binding ng-scope col-xs-12 col-sm-12 col-lg-12" data-component="crn-button" id="crn-button-846239"></div>
        <div class="col-xs-12 col-sm-3 col-lg-4" data-container="true"></div>
      </div>
    </div>
  </div>
</div>