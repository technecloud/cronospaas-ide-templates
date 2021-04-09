<style title="local">
    #crn-anchor-67621 {
        color: rgb(255, 255, 255);
        text-align: center;
        margin-top:10px;
    }
</style>

<ion-view role="region" aria-labelledby="login_page_title" cache-view="false" can-swipe-back="false" class="pane login-bg" data-container="true">
    <h1 class="sr-only" id="login_page_title">{{"Users.view.Login" | translate}}</h1>
    <ion-content class="scroll-content center-content-vertically" data-component="crn-ion-content">
    <div class="list safe-top" data-container="true">
      <div class="col text-center">
        <img aria-roledescription="logo" alt="{{'Accessibility.Login.Logo.Alt' | translate}}" src="img/logo.svg" class="component-holder logo" style="display: block; margin-left:auto; margin-right:auto;" xattr-position="display: block; margin-left:auto; margin-right:auto;" data-component="crn-image" id="crn-image-960683">
      </div>
    </div>
    <form class="form-validation" autocomplete="off" name="form" role="form">
      <input type="hidden" name="csrf_token" value="CIwNZNlR4XbisJF39I8yWnWX9wX4WFoz" />
      <div class="list list-inset login-mobile" data-container="true">
        <#if authentication?lower_case != "sso" && authentication?lower_case != "saml">
        <div class="item item-input component-holder" data-component="crn-input-icon" for="crn-input-icon-228215" title="{{'Login.view.Username' | translate}}">
          <input aria-label="{{'Login.view.Username' | translate}}" autocomplete="username" autocorrect="off" autocapitalize="off" type="text" placeholder="{{'Login.view.Username' | translate}}" ng-model="vars.username" id="crn-input-icon-228215">
        </div>
        <div class="item item-input component-holder" data-component="crn-input-icon" for="crn-input-icon37951" title="{{'Login.view.Password' | translate}}">
          <input aria-label="{{'Login.view.Password' | translate}}" autocomplete="current-password" type="password" placeholder="{{'Login.view.Password' | translate}}" ng-model="vars.password" id="crn-input-icon37951">
        </div>
        </#if>
        <div class="item" title="{{'Login.view.Login' | translate}}" for="crn-button-445347">
          <#if (authentication?lower_case == "saml")>
          <a role="button" aria-label="{{'Login.view.Login' | translate}}" href="/login" class="button component-holder button-full button-positive" target="_self" data-replace="true" data-component="crn-anchor">
              <span>{{"Login.view.Login" | translate}} </span>
          </a>
          <#elseif (authentication?lower_case == "sso")>
          <button ng-click="cronapi.social.ssoLogin();" role="button" aria-label="{{'Login.view.Login' | translate}}" class="button component-holder button-full button-positive" data-replace="true" data-component="crn-anchor">
              <span>{{"Login.view.Login" | translate}} </span>
          </button>
          <#else>
          <button role="button" aria-label="{{'Login.view.Login' | translate}}" class="button component-holder button-full button-positive" type="button" ng-click="cronapi.client('js.blockly.auth.Login.login').run(vars.username, vars.password, null)" data-component="crn-button" id="crn-button-445347" xattr-fullsize="button-full" xattr-theme="button-positive" ng-disabled="form.$invalid || vm.dataLoading">
            <i class=""></i>
            <span>{{"Login.view.Login" | translate}}</span>
          </button>
          </#if>
        </div>

        <div class="item">
          <a aria-label="{{'Signup' | translate}}" href="#/app/public/signup" class="component-holder" style="display:block" xattr-fullsize="display:block;" data-replace="true" data-component="crn-anchor" id="crn-anchor-67621">{{'Signup' | translate}}</a>
        </div>

        <div class="item" title="{{message.error}}">
          <div ng-show="message.error" class="help-block" data-container="true">
            {{message.error}}
          </div>
        </div>
      </div>
    </form>
  </ion-content>
</ion-view>