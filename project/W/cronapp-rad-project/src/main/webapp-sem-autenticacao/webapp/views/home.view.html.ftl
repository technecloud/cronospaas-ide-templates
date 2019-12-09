 <#if !(menuPosition??) || menuPosition == "Horizontal" >
<div class="component-holder ng-binding ng-scope" data-component="crn-navbar" id="crn-navbar-986427"> 
  <nav class="navbar navbar-default"> 
    <div class="container-fluid"> 
      <div class="navbar-header"> 
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="component-holder ng-binding ng-scope navbar-brand" data-component="crn-image" href="#/home"> <img src="plugins/cronapp-framework-js/dist/img/logo.png" style="max-height:30px; margin-top:-5px" id="crn-navbar-logo" data-component="crn-image"> </a>
      </div> 
      <div id="navbar" class="navbar-collapse collapse"> 
        <ul class="nav navbar-nav" style="float:none"> 
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
        <cron-dynamic-menu class="component-holder" data-component="crn-dynamic-menu" options="{&quot;subMenuOptions&quot;:[{&quot;id&quot;:&quot;1h85bvnhg7511&quot;,&quot;name&quot;:&quot;Home&quot;,&quot;title&quot;:&quot;{{'Home.view.Home' | translate}}&quot;,&quot;iconClass&quot;:&quot;fa fa-home&quot;,&quot;action&quot;:&quot;cronapi.screen.changeView('#/home', [])&quot;,&quot;level&quot;:1,&quot;menuItems&quot;:[]}]}">Dynamic Menu</cron-dynamic-menu>
        </ul> 
      </div> 
    </div> 
  </nav>
</div>
  <#else>
<div class="component-holder ng-binding ng-scope" data-component="crn-sidebar" id="crn-sidebar-986427"> 
  <div class="nav-side-menu navbar-default"> 
    <div class="brand"> 
      <img src="plugins/cronapp-framework-js/dist/img/logo.png" class="" width="" height="30" data-component="crn-image">
    </div> 
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content1"></i> 
    <div class="menu-list"> 
      <ul id="menu-content1" class="menu-content collapse out navbar-nav"> 
        <li data-toggle="collapse" data-target="#menu-sub-1" class="collapsed component-holder" data-component="crn-sidebar-item"> 
            <a href="#/home" class="">
                <i class="fa fa-lg fa-home"></i> 
                <span class="">{{"Home.view.Home" | translate}}</span> 
            </a> 
        </li> 
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
        <li data-toggle="collapse" data-component="crn-sidebar-item" data-target="#menu-sub-9831" class="collapsed component-holder"> </li> 
      </ul> 
    </div> 
  </div> 
</div> 
  </#if>
<div ui-view="" class="container-fluid main-view"> 
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
          <input type="hidden" name="csrf_token" value="CIwNZNlR4XbisJF39I8yWnWX9wX4WFoz" />
          <div class="text-danger wrapper text-center" ng-show="authError"> 
          </div> 
          <div class="list-group list-group-sm"> 
            <div class="list-group-item"> 
              <input type="password" class="form-control no-border" id="oldPassword" placeholder="{{'Home.view.Old Password' | translate}}"> 
            </div> 
            <div class="list-group-item"> 
              <input type="password" class="form-control no-border" id="newPassword" placeholder="{{'Home.view.New Password' | translate}}"> 
            </div> 
            <div class="list-group-item"> 
              <input type="password" class="form-control no-border" id="newPasswordConfirmation" placeholder="{{'Home.view.Confirmation' | translate}}"> 
            </div> 
          </div> 
        </form> 
      </div> 
      <div class="modal-footer"> 
        <button class="btn btn-primary" type="submit" ng-click="changePassword()" ng-disabled="form.$invalid || vm.dataLoading" >{{"Home.view.ChangePassword" | translate}}</button> 
        <button type="button" class="btn btn-default" data-dismiss="modal" >{{'Home.view.Close' | translate}}</button> 
      </div> 
    </div> 
  </div> 
</div>