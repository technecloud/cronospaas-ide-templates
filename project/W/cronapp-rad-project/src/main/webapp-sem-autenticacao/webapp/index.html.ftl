<!DOCTYPE html>
<html lang="en" ng-app="MyApp">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=5,9,10,11;Edge">
  <!-- CSS -->
  <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="node_modules/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
  <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css" />
  <link rel="stylesheet" href="node_modules/cronapp-framework-js/dist/css/app.css" />
  <link rel="stylesheet" href="node_modules/angular-ui-notification/dist/angular-ui-notification.min.css" />
  <#if !(theme??) || theme=="">
  <link id="themeSytleSheet" rel="stylesheet" href="node_modules/cronapp-framework-js/css/themes/material.min.css">
  <#else>
  <link id="themeSytleSheet" rel="stylesheet" href="node_modules/cronapp-framework-js/css/themes/${theme?lower_case}.min.css">
  </#if>
  <script src="js/customModules.js"></script>
  <link rel="stylesheet" href="css/app.css" />
</head>
<body>
  <div ui-view class="fill"></div>
  
  <!-- Modal Template -->
  <div id="modalTemplateContext" ng-include="'node_modules/cronapi-js/include/modal.view.html'"></div>
  <!-- Report -->
  <div id="reportViewContext" ng-include="'node_modules/cronapp-framework-js/components/reports/reports.view.html'"></div>
  <!-- Plugins -->
  <script src="node_modules/jquery/dist/jquery.min.js"></script>
  <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script data-pace-options='{"document": true, "eventLag": true, "restartOnPushState": true, "restartOnRequestAfter": true, "ajax": {"trackMethods": [ "PUT","POST","GET"] }}' src='node_modules/pace/pace.min.js'></script>
  <!-- Angular JS -->
  <script src="node_modules/angular/angular.min.js"></script>
  <script src="node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="node_modules/angular-chart.js/dist/angular-chart.min.js"></script>
  <script src="node_modules/angular-ui-router/release/angular-ui-router.min.js"></script>
  <script src="node_modules/angular-cookies/angular-cookies.min.js"></script>
  <script src="node_modules/angular-resource/angular-resource.min.js"></script>
  <script src="node_modules/angular-sanitize/angular-sanitize.min.js"></script>
  <script src="node_modules/angular-bootstrap/ui-bootstrap.min.js"></script>
  <script src="node_modules/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>
  <script src="node_modules/ui-select-infinity/lib/index.js"></script>
  <script src='node_modules/ngMask/dist/ngMask.min.js'></script>
  <script src="node_modules/raphael/raphael-min.js"></script>
  <script src="node_modules/justgage-toorshia/justgage.js"></script>
  <script src="node_modules/angular-justgage/ng-justgage.js"></script>
  <script src="node_modules/angular-translate/angular-translate.min.js"></script>
  <script src="node_modules/angular-translate-loader-static-files/angular-translate-loader-static-files.min.js"></script>
  <script src="node_modules/angular-translate-storage-cookie/angular-translate-storage-cookie.min.js"></script>
  <script src="node_modules/angular-translate-storage-local/angular-translate-storage-local.min.js"></script>
  <script src="node_modules/angular-translate-handler-log/angular-translate-handler-log.min.js"></script>
  <script src="node_modules/angular-dynamic-locale/dist/tmhDynamicLocale.js"></script>
  <script src="node_modules/angular-ui-notification/dist/angular-ui-notification.min.js"></script>
  <script src="node_modules/ng-file-upload/ng-file-upload.min.js"></script>
  <script src="node_modules/moment/min/moment-with-locales.min.js"></script>
  <script src="node_modules/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <script src="node_modules/cpf_cnpj/build/cpf.js"></script>
  <script src="node_modules/cpf_cnpj/build/cnpj.js"></script>
  <script src="js/blockly.js"></script>
  <script src="node_modules/cronapi-js/dist/cronapi.min.js"></script>
  <!-- Custom -->
  <script src="js/events.js"></script>
  <!-- CronApp Framework -->
  <script src="node_modules/cronapp-framework-js/dist/js/app.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/controllers.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/services.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/LocaleService.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/LanguageSelectDirective.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/directives.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/filters.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/components/js/datasource.js"></script>
  <!-- CronApp Reports --> 
  <script src="node_modules/cronapp-framework-js/dist/js/reports/parameters.controller.js"></script>
  <script src="node_modules/cronapp-framework-js/dist/js/reports/reports.service.js"></script>
  <!-- Custom Controllers -->
  <script src="js/custom.controllers.js"></script>
</body>
</html>
