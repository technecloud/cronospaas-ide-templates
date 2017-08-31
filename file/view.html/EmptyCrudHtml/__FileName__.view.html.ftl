<h3>Title</h3>
<div data-component="crn-datasource" id="crn-datasource-763276" class="component-holder">
  <datasource filter="" name="Data" entity="" keys="id" rows-per-page="100" delete-message="{{'WhatsRemove' | translate}}"></datasource>
</div>
<div class="row component-holder" data-component="crn-horizontal-container" id="crn-horizontal-container-156199">
  <div class="column active col-xs-12 form-group" data-container="true" data-replace="true">
    <button data-component="crn-button" id="crn-button-564202" class="btn btn-primary form-group" type="submit" onclick="" ng-click="Data.startInserting()" ng-hide="Data.inserting || Data.editing"><i class="fa fa-user"></i> <span>{{"template.crud.new" | translate}}</span></button>
  </div>
</div>
<div class="component-holder ng-binding ng-scope" data-component="crn-textinput" id="crn-textinput-979039" ng-hide="Data.inserting || Data.editing">
  <div class="form-group">
    <input type="text" ng-model="vars.search" class="form-control" id="search-id" placeholder="Buscar..." ng-change="Data.searchAll(vars.search)">
  </div>
</div>
<div class="component-holder" data-component="crn-grid" id="crn-grid-data">
  <div crn-datasource="Data" ng-hide="Data.editing || Data.inserting">
    <table class="table  table-bordered table-hover table-striped">
      <thead>
        <tr class="table-header">
          <th class="active">
            <div data-container="true">
               Id
            </div> </th>
          <th>
            <div data-container="true">
               Column 1
            </div> </th>
          <th>
            <div data-container="true">
               {{"template.crud.actions" | translate}}
            </div> </th>
        </tr>
      </thead>
      <tbody>
        <tr class="table-content" ng-repeat="rowData in datasource.data">
          <td class="active">
            <div data-container="true">
               {{rowData.id}}
            </div> </td>
          <td>
            <div data-container="true">
               {{rowData.field1}}
            </div> </td>
          <td>
            <div>
              <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.startEditing(rowData)"><i class="fa fa-edit"></i></button>
              <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button>
            </div> </td>
        </tr>
      </tbody>
    </table>
    <div class="table-footer-controls">
      <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()">{{"template.crud.load_more" | translate}}</button>
    </div>
  </div>
</div>
<div data-component="crn-form" id="crn-form-form-data">
  <div class="form" ng-show="Data.editing || Data.inserting">
    <form crn-datasource="Data">
      <div class="tool-bar" ng-hide="datasource.editing || datasource.inserting" crn-datasource="Data">
        <button class="btn btn-primary" ng-click="datasource.startInserting()"><i class="glyphicon glyphicon-plus-sign"></i></button>
        <button class="btn btn-success" ng-click="datasource.startEditing()"><i class="glyphicon glyphicon-edit"></i></button>
        <button class="btn btn-primary" ng-disabled="!datasource.hasPrevious()" ng-click="datasource.previous()"><i class="glyphicon glyphicon-chevron-left"></i></button>
        <button class="btn btn-primary" ng-disabled="!datasource.hasNext()" ng-click="datasource.next()"><i class="glyphicon glyphicon-chevron-right"></i></button>
        <button class="btn btn-primary" ng-click="datasource.remove()"><i class="glyphicon glyphicon-trash"></i></button>
      </div>
      <div class="active-bar" ng-hide="!datasource.editing &amp;&amp; !datasource.inserting">
        <button class="btn btn-success" ng-click="datasource.post()"><i class="glyphicon glyphicon-ok"></i></button>
        <button class="btn btn-danger" ng-click="datasource.cancel()"><i class="glyphicon glyphicon-remove"></i></button>
      </div>
      <br>
      <fieldset ng-disabled="!datasource.editing &amp;&amp; !datasource.inserting">
        <div data-component="crn-textinput" id="crn-textinput-email">
          <div class="form-group">
            <label for="textinput-email">Id</label>
            <input type="text" ng-model="Data.active.id" class="form-control" id="textinput-email" placeholder="Id">
          </div>
        </div>
        <div class="component-holder ng-binding ng-scope" data-component="crn-textinput" id="crn-textinput-891962">
          <div class="form-group">
            <label for="exampleInputEmail1">Label</label>
            <input type="text" data-component="crn-input" ng-model="" class="component-holder form-control" id="textinput-id" placeholder="Placeholder text">
          </div>
        </div>
      </fieldset>
    </form>
  </div>
</div>