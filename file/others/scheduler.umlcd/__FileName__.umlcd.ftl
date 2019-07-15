{
"cells": [
{
"type": "basic.Rect",
"position": {
"x": 0,
"y": 0
},
"size": {
"width": 0,
"height": 0
},
"angle": 0,
"id": "paperCell",
"runtimeClass": "cronos.widgets.joint.uml.Paper",
"async": {
"batchSize": 500
},
"z": 1,
"namespace": "scheduler",
"queries": [],
"attrs": {}
},
{
"type": "uml.Class",
"attrs": {
"rect": {
"width": 235,
"stroke": "yellow",
"stroke-width": 2
},
".uml-class-name-rect": {
"stroke": "#C2C2C2",
"stroke-width": 1,
"fill": "#F0F0F0",
"height": 50,
"transform": "translate(0,0)"
},
".uml-class-attrs-rect": {
"stroke": "#C2C2C2",
"stroke-width": 1,
"fill": "#F0F0F0",
"height": 250,
"transform": "translate(0,50)"
},
".uml-class-methods-rect": {
"stroke": "#C2C2C2",
"stroke-width": 1,
"fill": "#F0F0F0",
"height": 30,
"transform": "translate(0,300)"
},
".uml-class-name-text": {
"ref": ".uml-class-name-rect",
"ref-y": 0.5,
"ref-x": 0.5,
"text-anchor": "middle",
"y-alignment": "middle",
"fill": "#000",
"font-size": 12,
"font-family": "Arial",
"text": "CronScheduler",
"font-weight": "bold"
},
".uml-class-attrs-text": {
"ref": ".uml-class-attrs-rect",
"ref-y": 15,
"ref-x": 15,
"fill": "#666",
"font-size": 11,
"font-family": "Arial",
"text": "id\ntitle\nstart\nend\nstartTimezone\nendTimezone\ndescription\nrecurrenceId\nrecurrenceRule\nrecurrenceException\nisAllDay\n"
},
".uml-class-attrs-value": {
"ref": ".uml-class-attrs-rect",
"ref-y": 15,
"ref-x": 135.875,
"fill": "#0066FF",
"font-size": 11,
"font-family": "Arial",
"text": "Texto\nTexto\nData e Hora com Fuso\nData e Hora com Fuso\nTexto\nTexto\nTexto\nTexto\nTexto\nTexto\nLógico\n"
},
".uml-class-methods-text": {
"ref": ".uml-class-methods-rect",
"ref-y": 15,
"ref-x": 15,
"fill": "#0066FF",
"font-size": 11,
"font-family": "Arial",
"text": ""
},
".": {
"fill": "#ffffff",
"stroke": "none"
}
},
"name": "CronScheduler",
"attributes": [
"id:java.lang.String",
"title:java.lang.String",
"start:java.sql.Timestamp",
"end:java.sql.Timestamp",
"startTimezone:java.lang.String",
"endTimezone:java.lang.String",
"description:java.lang.String",
"recurrenceId:java.lang.String",
"recurrenceRule:java.lang.String",
"recurrenceException:java.lang.String",
"isAllDay:java.lang.Boolean"
],
"methods": [],
"position": {
"x": 330,
"y": 86
},
"size": {
"width": 264.515625,
"height": 205.96070861816406
},
"angle": 0,
"realName": "",
"role": "Auto",
"generateView": "Auto",
"isRest": "true",
"id": "75b78238-8ead-46e8-bab0-85891857339e",
"modelType": "Table",
"fields": [
{
"name": "id",
"type": "java.lang.String",
"dbName": "id",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Id",
"mask": "",
"isPrimaryKey": true,
"isUniqueKey": false,
"isNullable": false,
"pkType": "UUID",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "title",
"type": "java.lang.String",
"dbName": "title",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Title",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "start",
"type": "java.sql.Timestamp",
"dbName": "start",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Start",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "end",
"type": "java.sql.Timestamp",
"dbName": "end",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "End",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "startTimezone",
"type": "java.lang.String",
"dbName": "startTimezone",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Start Timezone",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "endTimezone",
"type": "java.lang.String",
"dbName": "endTimezone",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "End Timezone",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "description",
"type": "java.lang.String",
"dbName": "description",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Description",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "recurrenceId",
"type": "java.lang.String",
"dbName": "recurrenceId",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Recurrence Id",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "recurrenceRule",
"type": "java.lang.String",
"dbName": "recurrenceRule",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Recurrence Rule",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "recurrenceException",
"type": "java.lang.String",
"dbName": "recurrenceException",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Recurrence Exception",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
},
{
"name": "isAllDay",
"type": "java.lang.Boolean",
"dbName": "isAllDay",
"dbLength": "",
"dbPrecision": "",
"dbScale": "",
"dbDefaultValue": "",
"label": "Is All Day",
"mask": "",
"isPrimaryKey": false,
"isUniqueKey": false,
"isNullable": true,
"pkType": "",
"multitenantContext": "",
"jsonIgnore": false,
"isTransient": false,
"isInsertable": true,
"isUpdatable": true,
"isEncryption": false,
"referencedColumnName": "",
"isSearchable": false
}
],
"runtimeClass": "cronos.widgets.joint.uml.Class",
"z": 2,
"queries": []
}
],
"selectedGroup": "",
"groups": [
{
"name": "",
"id": "d2c701d2-8d2d-4aee-962a-0266851aced2",
"cells": [
"75b78238-8ead-46e8-bab0-85891857339e"
]
}
]
}