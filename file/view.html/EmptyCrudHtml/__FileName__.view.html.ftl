<h2 class="component-holder text-left h3 title">Title</h2>

<datasource data-component="crn-datasource" filter="" name="MainDatasource" entity="" keys="" rows-per-page="100" class="" schema="" lazy=""></datasource> 

<div role="search" ng-hide="MainDatasource.inserting || MainDatasource.editing" data-component="crn-datasource-filter" id="crn-datasource-filter" class="">
  <div class="form-group"> 
    <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label> 
    <input type="text" ng-model="vars.search" id="textinput-filter" class="form-control k-textbox" cronapp-filter="" cronapp-filter-operator="" cronapp-filter-caseinsensitive="false" cronapp-filter-autopost="true" crn-datasource="MainDatasource" value="" placeholder="{{'template.crud.search' | translate}}"> 
  </div> 
</div> 

<div ng-hide="MainDatasource.editing || MainDatasource.inserting" class="component-holder ng-binding ng-scope" data-component="crn-cron-grid" id="cron-crn-grid-search"> 
  <cron-grid options="{&quot;dataSourceScreen&quot;:{},&quot;allowPaging&quot;:true,&quot;allowSorting&quot;:true,&quot;allowGrouping&quot;:false,&quot;allowSelectionTotalPageToShow&quot;:true,&quot;allowRefreshGrid&quot;:true,&quot;allowSelectionRow&quot;:true,&quot;editable&quot;:&quot;datasource&quot;,&quot;columns&quot;:[],&quot;toolBarButtons&quot;:[{&quot;type&quot;:&quot;Native&quot;,&quot;title&quot;:&quot;create&quot;}],&quot;details&quot;:[]}" ng-model="vars.gridmain" class="" style=""> 
  </cron-grid> 
</div> 
<div data-component="crn-form" id="crn-form-form"> 
  <div class="form" ng-show="MainDatasource.editing || MainDatasource.inserting"> 
    <form crn-datasource="MainDatasource" class=""> 
      <div class="tool-bar" ng-hide="datasource.editing || datasource.inserting"> 
        <button aria-label="{{'StartInserting' | translate}}" class="btn btn-primary btn-fab k-button" data-component="crn-button" ng-click="datasource.startInserting()"><span class="k-icon k-i-plus"></span></button>
        <button aria-label="{{'StartEditing' | translate}}" class="btn btn-primary btn-fab k-button" data-component="crn-button" ng-click="datasource.startEditing()"><span class="k-icon k-i-edit"></span></button>
        <button aria-label="{{'Before' | translate}}" class="btn btn-primary btn-fab k-button" data-component="crn-button" ng-disabled="!datasource.hasPrevious()" ng-click="datasource.previous()"><span class="k-icon k-i-arrow-chevron-left"></span></button>
        <button aria-label="{{'Next' | translate}}" class="btn btn-primary btn-fab k-button" data-component="crn-button" ng-disabled="!datasource.hasNext()" ng-click="datasource.next()"><span class="k-icon k-i-arrow-chevron-right"></span></button>
        <button aria-label="{{'Remove' | translate}}" class="btn btn-danger btn-fab k-button" data-component="crn-button" ng-click="datasource.remove()"><span class="k-icon k-i-close"></span></button>
      </div> 
      <div class="active-bar" ng-hide="!datasource.editing &amp;&amp; !datasource.inserting"> 
        <button aria-label="{{'SaveChanges' | translate}}" class="btn btn-success btn-fab k-button" id="btn_crud_post41107" data-component="crn-button" ng-click="datasource.post()"><span class="k-icon k-i-check"></span></button>
        <button aria-label="{{'CancelChanges' | translate}}" class="btn btn-danger btn-fab k-button" id="btn_crud_cancel41107" data-component="crn-button" ng-click="datasource.cancel()"><span class="k-icon k-i-cancel"></span></button>
      </div> 
      <br> 
      <fieldset ng-disabled="!datasource.editing &amp;&amp; !datasource.inserting"> 
        <div class="component-holder ng-binding ng-scope" data-component="crn-textinput" id="crn-textinput-98075">
          <div class="form-group">
            <label for="input5045">Label</label>
            <input type="text" mask="" mask-placeholder="" ng-required="false" ng-model="vars.input5045" class="form-control k-textbox" id="input5045" placeholder="Placeholder text">
          </div>
        </div> 
      </fieldset> 
    </form>
	  
  </div> 
</div>