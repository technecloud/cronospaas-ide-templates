<#if !(menuPosition??) || menuPosition == "Horizontal" >
<div class="jumbotron jumbotron-fluid main-title">
    <h2 class="component-holder text-left" xattr-position="text-left" data-component="crn-subtitle" id="crn-subtitle-814474">${appname}</h2>
</div>
</#if>
<div class="component-holder ng-binding ng-scope  <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical</#if>"" data-component="crn-navbar" id="crn-navbar-986427">
  <nav class="navbar navbar-default <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar</#if>">
    <div class="container-fluid <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-container-fluid</#if>">
      <div class="navbar-header <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-header</#if>">
        <button type="button" class="navbar-toggle collapsed <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-toggle</#if>" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="component-holder ng-binding ng-scope navbar-brand" data-component="crn-image" href="#/home"> <img src="plugins/cronapp-framework-js/dist/img/logo.svg" style="width:101px; margin-top:-4px" id="crn-navbar-logo" data-component="crn-image"> </a>
      </div>
      <div id="navbar" class="navbar-collapse collapse <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-collapse</#if>">
        <ul class="nav navbar-nav <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-nav</#if>" style="float:none">
          <li class="dropdown component-holder" data-component=""> <a href="#/home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-lg fa-home"></i> <span>{{"Home.view.Home" | translate}}</span> </a> </li>
          <li class="dropdown component-holder" data-component="crn-menu-item" cronapp-security="visible : Administrators"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-users fa-lg"></i> <span>{{"Home.view.Admin" | translate}}</span> <span class="caret"></span> </a>
            <ul class="dropdown-menu">
              <li><a href="#/home/admin/user" class="component-holder" data-component="crn-anchor" >{{"Home.view.Users" | translate}}</a></li>
            <#if !(customMenu??) >
      <#if multitenant?? && multitenant?lower_case == "sim">
              <li><a href="#/home/logged/department" class="component-holder" data-component="crn-anchor">{{"Home.view.Department" | translate}}</a></li>
            </#if>
            </#if>      
            </ul> </li>
    <#if (customMenu??) >
      <#list customMenu?keys as key>
      <#assign items = customMenu[key]>
      <li class="dropdown component-holder" data-component="crn-menu-item"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class=""></i> <span>${key}</span> <span class="caret"></span> </a>
      <#if (items??) >
            <ul class="dropdown-menu">
        <#list items as item> 
              <li><a href="#/home/logged/${item.name?lower_case}" class="component-holder" data-component="crn-anchor" >${item.realName}</a></li>
        </#list>
            </ul> 
      </#if>
      </li>
      </#list>
    </#if>  
          <li class="dropdown component-holder navbar-right <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-right</#if>" data-component="crn-menu-item"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-lg fa-gear"></i> <span>{{"ChooseTheme" | translate}}</span> <span class="caret"></span> </a>
            <ul class="dropdown-menu">
              <li ng-repeat="theme in themes" ng-click="changeTheme(theme)"> <a href="javascript:void(0);" ng-class="{'bg-primary': myTheme==theme}">{{theme}} <i class="fa fa-lg fa-check pull-right" ng-if="myTheme==theme"></i></a></li>
            </ul> </li>
          <li class="dropdown component-holder navbar-right <#if !(menuPosition??) || menuPosition == "Vertical">crn-navigator-vertical-navbar-right</#if>" data-component="crn-menu-item"> <a href="javascript:void(0);" class="dropdown-toggle"  style="color: #fff;min-width: 123px;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img class="user-avatar" alt="{{session.user.name}}" ng-src="{{session.user.picture || 'plugins/cronapp-framework-js/dist/img/img-user.svg'}}" style="max-height:22px;max-width:22px" data-component="crn-image"> <span>{{session.user.name}}</span> <span class="caret"></span> </a>
            <ul class="dropdown-menu">
              <li><a class="component-holder" data-toggle="modal" data-target="#modalPassword" data-component="crn-anchor" >{{"Home.view.ChangePassword" | translate}}</a></li>
              <li><a ng-click="logout()" href="" data-component="crn-anchor"><span>{{"Home.view.Logout" | translate}}</span></a></li>
            </ul> </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<div ui-view="" class="container-fluid <#if !(menuPosition??) || menuPosition == "Horizontal">main-view<#else>main-view-sidebar</#if>" data-container="true">
</div>

<div class="modal fade" id="modalPassword">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title">{{"Home.view.ChangePassword" | translate}}</h4>
      </div>
      <div class="modal-body">
        <form class="form-validation" autocomplete="off" name="form" role="form">
          <div class="text-danger wrapper text-center" ng-show="authError">
          </div>
          <div class="list-group list-group-sm">
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="oldPassword" placeholder="{{'Home.view.Old Password' | translate}}" ng-required="true">
            </div>
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="newPassword" placeholder="{{'Home.view.New Password' | translate}}" ng-required="true">
            </div>
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="newPasswordConfirmation" placeholder="{{'Home.view.Confirmation' | translate}}" ng-required="true">
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary btn-fab k-button" type="submit" ng-click="changePassword()" ng-disabled="form.$invalid || vm.dataLoading"><span class="k-icon k-i-check"></span></button>
        <button class="btn btn-default btn-fab k-button" type="button" data-dismiss="modal"><span class="k-icon k-i-close"></span></button>
      </div>
    </div>
  </div>
</div>