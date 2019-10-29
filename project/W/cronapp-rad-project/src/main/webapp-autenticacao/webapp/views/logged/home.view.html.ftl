<#if !(menuPosition??) || menuPosition == "Horizontal">
<header class="jumbotron-fluid main-title">
    <h1 class="component-holder text-left" xattr-position="text-left" data-component="crn-subtitle" id="crn-subtitle-814474">${appname}</h1>
</header>
</#if>
<div class="component-holder ng-binding ng-scope <#if !(menuPosition??) || menuPosition == "Horizontal">crn-navigator-horizontal<#else>crn-navigator-vertical</#if>" data-component="crn-navbar" id="crn-navbar-986427">
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="component-holder ng-binding ng-scope navbar-brand" data-component="crn-image" ng-click="cronapi.screen.changeView('#/home', [])"> <img alt="cronapp-logo" src="plugins/cronapp-framework-js/dist/img/logo.svg" style="width:101px; margin-top:-4px" id="crn-navbar-logo" data-component="crn-image"> </a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav" style="float:none">
    <#if (customMenu??) >
      <#list customMenu?keys as key>
      <#assign items = customMenu[key]>
      <li class="dropdown component-holder" data-component="crn-menu-item"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" aria-label="${key}"> <i class=""></i> <span>${key}</span> <span class="caret"></span> </a>
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
            <cron-dynamic-menu class="component-holder" data-component="crn-dynamic-menu" options="{&quot;subMenuOptions&quot;:[{&quot;id&quot;:&quot;1h85bvnhg7511&quot;,&quot;name&quot;:&quot;Home&quot;,&quot;title&quot;:&quot;{{'Home.view.Home' | translate}}&quot;,&quot;iconClass&quot;:&quot;fa fa-home&quot;,&quot;action&quot;:&quot;cronapi.screen.changeView('#/home', [])&quot;,&quot;level&quot;:1,&quot;menuItems&quot;:[]},{&quot;id&quot;:&quot;1iynbo1wq8twj&quot;,&quot;name&quot;:&quot;Admin&quot;,&quot;title&quot;:&quot;{{'Home.view.Administration' | translate}}&quot;,&quot;iconClass&quot;:&quot;fa fa-user&quot;,&quot;security&quot;:&quot;visible : Administrators, enabled : Administrators&quot;,&quot;action&quot;:&quot;&quot;,&quot;level&quot;:1,&quot;menuItems&quot;:[{&quot;id&quot;:&quot;t4fkwdjzlcmu&quot;,&quot;name&quot;:&quot;Users&quot;,&quot;title&quot;:&quot;{{'Home.view.Users' | translate}}&quot;,&quot;iconClass&quot;:&quot;fa fa-user&quot;,&quot;security&quot;:&quot;visible : Administrators, enabled : Administrators&quot;,&quot;action&quot;:&quot;cronapi.screen.changeView('#/home/admin/user', [])&quot;,&quot;level&quot;:2,&quot;menuItems&quot;:[]}]}]}">Dynamic Menu</cron-dynamic-menu>
            <div class="nav navbar-nav navbar-right">
                <li class="dropdown component-holder" data-component="crn-menu-item"> <a href class="dropdown-toggle"  style="min-width: 123px;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img class="user-avatar" alt="" ng-src="{{session.user.picture || 'plugins/cronapp-framework-js/dist/img/img-user.svg'}}" style="max-height:22px;max-width:22px" data-component="crn-image"> <span>{{"Home.view.Perfil" | translate}}</span> <span class="caret"></span> </a>
                    <ul class="dropdown-menu">
                        <li><a class="component-holder" data-toggle="modal" data-target="#modalPassword" data-component="crn-anchor" >{{"Home.view.ChangePassword" | translate}}</a></li>
                        <li><a ng-click="logout()" href="" data-component="crn-anchor"><span>{{"Home.view.Logout" | translate}}</span></a></li>
                    </ul> </li>
                <li class="dropdown component-holder" data-component="crn-menu-item"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-lg fa-gear"></i> <span>{{"ChooseTheme" | translate}}</span> <span class="caret"></span> </a>
                    <ul class="dropdown-menu">
                        <li ng-repeat="theme in themes" ng-click="changeTheme(theme)"> <a href="javascript:void(0);" ng-class="{'bg-primary': myTheme==theme}">{{theme}} <i class="fa fa-lg fa-check pull-right" ng-if="myTheme==theme"></i></a></li>
                    </ul> </li>
            </div>
        </ul>
      </div>
    </div>
  </nav>
</div>
<div ui-view="" role="main" class="container-fluid main-view <#if !(menuPosition??) || menuPosition == "Horizontal">main-view-horizontal<#else>main-view-vertical</#if>">
</div> 
<div class="modal fade" id="modalPassword">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"><span aria-hidden="true">×</span></button>
        <h2 class="modal-title">{{"Home.view.ChangePassword" | translate}}</h2>
      </div>
      <div class="modal-body">
        <form class="form-validation" autocomplete="off" name="form" role="form">
          <div class="text-danger wrapper text-center" ng-show="authError">
          </div>
          <div class="list-group list-group-sm">
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="oldPassword" placeholder="{{'Home.view.Old Password' | translate}}" aria-label="{{'Home.view.Old Password' | translate}}" ng-required="true">
            </div>
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="newPassword" placeholder="{{'Home.view.New Password' | translate}}" aria-label="{{'Home.view.New Password' | translate}}" ng-required="true">
            </div>
            <div class="list-group-item">
              <input type="password" class="form-control k-textbox" id="newPasswordConfirmation" placeholder="{{'Home.view.Confirmation' | translate}}" aria-label="{{'Home.view.Confirmation' | translate}}" ng-required="true">
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary btn-fab k-button" type="submit" ng-click="changePassword()" ng-disabled="form.$invalid || vm.dataLoading" aria-label="{{'Save' | translate}}"><span class="k-icon k-i-check"></span></button>
        <button class="btn btn-default btn-fab k-button" type="button" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"><span class="k-icon k-i-close"></span></button>
      </div>
    </div>
  </div>
</div>