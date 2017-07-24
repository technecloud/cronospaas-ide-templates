<!DOCTYPE html>
<html lang="en" ng-app="MyApp">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=5,9,10,11;Edge">
  <!-- CSS -->
  <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="plugins/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
  <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" href="plugins/angular-ui-select/dist/select.min.css" />
  <link rel="stylesheet" href="plugins/cronapp-framework-js/dist/css/cronos.css" />
  <link rel="stylesheet" href="plugins/cronapp-framework-js/dist/css/cronos-bootstrap.css" />
  <link rel="stylesheet" href="plugins/cronapp-framework-js/dist/css/app.css" />
  <link rel="stylesheet" href="plugins/angular-ui-notification/dist/angular-ui-notification.min.css" />
  <#if !(theme??) || theme=="">
  <link id="themeSytleSheet" rel="stylesheet" href="">
  <#else>
  <link id="themeSytleSheet" rel="stylesheet" href="plugins/cronapp-framework-js/dist/css/themes/${theme?lower_case}.min.css">
  </#if>
</head>
<body>
  <div ui-view class="fill"></div>
  <div class="modal fade" id="modalTemplate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalTemplateTitle">Title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modalTemplateClose"><span aria-hidden="true">×</span></button>
        </div>
        <div class="modal-body" id="modalTemplateBody">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modalTemplateCancel">Cancel</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalTemplateSave">Save</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Plugins -->
  <script src="plugins/jquery/dist/jquery.min.js"></script>
  <script src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
  <script data-pace-options='{"document": true, "eventLag": true, "restartOnPushState": true, "restartOnRequestAfter": true, "ajax": {"trackMethods": [ "PUT","POST","GET"] }}' src='plugins/pace/pace.min.js'></script>
  <!-- Angular JS -->
  <script src="plugins/angular/angular.min.js"></script>
  <script src="plugins/chart.js/dist/Chart.min.js"></script>
  <script src="plugins/angular-chart.js/dist/angular-chart.min.js"></script>
  <script src="plugins/angular-ui-router/release/angular-ui-router.min.js"></script>
  <script src="plugins/angular-cookies/angular-cookies.min.js"></script>
  <script src="plugins/angular-resource/angular-resource.min.js"></script>
  <script src="plugins/angular-sanitize/angular-sanitize.min.js"></script>
  <script src="plugins/angular-bootstrap/ui-bootstrap.min.js"></script>
  <script src="plugins/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>
  <script src="plugins/angular-ui-select/dist/select.min.js"></script>
  <script src="plugins/ui-select-infinity/lib/index.js"></script>
  <script src='plugins/ngMask/dist/ngMask.min.js'></script>
  <script src="plugins/raphael/raphael-min.js"></script>
  <script src="plugins/justgage-toorshia/justgage.js"></script>
  <script src="plugins/angular-justgage/ng-justgage.js"></script>
  <script src="plugins/angular-translate/angular-translate.min.js"></script>
  <script src="plugins/angular-translate-loader-static-files/angular-translate-loader-static-files.min.js"></script>
  <script src="plugins/angular-translate-storage-cookie/angular-translate-storage-cookie.min.js"></script>
  <script src="plugins/angular-translate-storage-local/angular-translate-storage-local.min.js"></script>
  <script src="plugins/angular-translate-handler-log/angular-translate-handler-log.min.js"></script>
  <script src="plugins/angular-dynamic-locale/dist/tmhDynamicLocale.js"></script>
  <script src="plugins/angular-ui-notification/dist/angular-ui-notification.min.js"></script>
  <script src="plugins/ng-file-upload/ng-file-upload.min.js"></script>
  <script src="plugins/moment/min/moment-with-locales.min.js"></script>
  <script src="plugins/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <script src="plugins/cpf_cnpj/build/cpf.js"></script>
  <script src="plugins/cpf_cnpj/build/cnpj.js"></script>
  <script src="plugins/cronapi-js/dist/cronapi.min.js"></script>
  <!-- Custom -->
  <script src="js/events.js"></script>
  <!-- CronApp Framework -->
  <script src="plugins/cronapp-framework-js/js/app.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/controllers.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/services.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/LocaleService.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/LanguageSelectDirective.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/directives.js"></script>
  <script src="plugins/cronapp-framework-js/dist/js/filters.js"></script>
  <script src="plugins/cronapp-framework-js/dist/components/js/datasource.js"></script>
</body>
</html>