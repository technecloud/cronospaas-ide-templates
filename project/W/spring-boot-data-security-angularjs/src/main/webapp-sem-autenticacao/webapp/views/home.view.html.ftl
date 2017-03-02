<div class="component-holder ng-binding ng-scope" data-component="crn-navbar" id="crn-navbar-986427"> 
  <#if menuPosition == "Horizontal">
  <nav class="navbar navbar-default"> 
    <div class="container-fluid"> 
      <div class="navbar-header"> 
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> 
        <a class="navbar-brand" href="javascript:void(0);">
            <div class="component-holder ng-binding ng-scope" data-component="crn-image" id="crn-image-535259"><img src="img/logo.png" style="max-height:30px; margin-top:-5px"></div>
        </a> 
      </div> 
      <div id="navbar" class="navbar-collapse collapse"> 
        <ul class="nav navbar-nav" style="float:none"> 
          <li class="dropdown component-holder" data-component=""> <a href="#/home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-lg fa-home"></i> <span >{{"Home.view.Home" | translate}}</span> </a> </li> 
        </ul> 
      </div> 
    </div> 
  </nav>
  <#else>
  <div class="nav-side-menu navbar-default"> 
    <div class="brand"> 
      <img src="img/logo.png" class="" width="" height="30"> 
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
        <li data-toggle="collapse" data-component="crn-sidebar-item" data-target="#menu-sub-9831" class="collapsed component-holder"> </li> 
      </ul> 
    </div> 
  </div> 
  </#if>
</div> 
<div ui-view="" class="container-fluid main-view" data-container="true"> 
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