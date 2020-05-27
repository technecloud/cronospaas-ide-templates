<#if !(menuPosition??) || menuPosition == "Horizontal">
<div class="jumbotron jumbotron-fluid main-title">
    <h2 class="component-holder text-left" xattr-position="text-left" data-component="crn-subtitle" id="crn-subtitle-814474">${appname}</h2>
</div>
</#if>
<div class="component-holder ng-binding ng-scope <#if !(menuPosition??) || menuPosition == "Horizontal">crn-navigator-horizontal<#else>crn-navigator-vertical</#if>" data-component="crn-navbar" id="crn-navbar-986427">
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="component-holder ng-binding ng-scope navbar-brand" data-component="crn-image" href="#/home"> <img src="plugins/cronapp-framework-js/dist/img/logo.svg" style="width:101px; margin-top:-4px" id="crn-navbar-logo" data-component="crn-image"> </a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav" style="float:none">
          <li class="dropdown component-holder" data-component=""> <a href="#/home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-lg fa-home"></i> <span>{{"Home.view.Home" | translate}}</span> </a> </li>
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
        </ul>
      </div>
    </div>
  </nav>
</div>
<div ui-view="" class="container-fluid main-view <#if !(menuPosition??) || menuPosition == "Horizontal">main-view-horizontal<#else>main-view-vertical</#if>">
</div> 
