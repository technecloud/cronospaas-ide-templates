{
	"auth": {
		"customId": "auth",
		"queryName": "{{AUTHENTICATE}}",
		"screen": "",
		"sourceType": "entityFullName",
		"blockly": null,
		"entitySimpleName": "User",
		"entityFullName": "app.entity.User",
		"query": "select o from User o where o.login = :login",
		"queryParamsValues": [
			{
				"fieldName": "login",
				"fieldValue": ""
			}
		],
		"verbs": {
			"GET": false,
			"GETAuthorities": null,
			"POST": false,
			"POSTAuthorities": null,
			"PUT": false,
			"PUTAuthorities": null,
			"DELETE": false,
			"DELETEAuthorities": null
		},
		"events": {
			"beforeInsert": null,
			"beforeUpdate": null,
			"beforeDelete": null,
			"afterInsert": null,
			"afterUpdate": null,
			"afterDelete": null,
			"onNavigate": null,
			"onGetData": null
		},
		"defaultValues": {
			"id": null,
			"email": null,
			"name": null,
			"login": null,
			"picture": null,
			"password": null,
			"theme": null
		},
		"security": {
			"id": null,
			"email": null,
			"name": null,
			"login": null,
			"picture": null,
			"password": null,
			"theme": null
		},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/query/auth/"
	},
	"roles": {
		"customId": "roles",
		"queryName": "{{GET_ROLES}}",
		"screen": "",
		"sourceType": "entityFullName",
		"blockly": null,
		"entitySimpleName": "Role",
		"entityFullName": "app.entity.Role",
		"query": "select o.id from Role o where o.user.login = :login",
		"queryParamsValues": [
			{
				"fieldName": "login",
				"fieldValue": ""
			}
		],
		"verbs": {
			"GET": false,
			"GETAuthorities": null,
			"POST": false,
			"POSTAuthorities": null,
			"PUT": false,
			"PUTAuthorities": null,
			"DELETE": false,
			"DELETEAuthorities": null,
			"FILTER": true,
			"FILTERAuthorities": null
		},
		"events": {
			"beforeInsert": null,
			"beforeUpdate": null,
			"beforeDelete": null,
			"afterInsert": null,
			"afterUpdate": null,
			"afterDelete": null,
			"onNavigate": null,
			"onGetData": null
		},
		"defaultValues": {
			"id": null,
			"user": null
		},
		"security": {
			"id": null,
			"user": null
		},
		"calcFields": {},
		"calcFieldsSecurity": {},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/query/roles/"
	},
	"tenant": {
		"customId": "tenant",
		"queryName": "{{GET_TENANT_ID}}",
		"screen": "",
		"sourceType": "entityFullName",
		"blockly": null,
		"entitySimpleName": "User",
		"entityFullName": "app.entity.User",
		"query": "select u.company.id from User u where u.login = :login",
		"queryParamsValues": [
			{
				"fieldName": "login",
				"fieldValue": ""
			}
		],
		"verbs": {
			"GET": false,
			"GETAuthorities": null,
			"POST": false,
			"POSTAuthorities": null,
			"PUT": false,
			"PUTAuthorities": null,
			"DELETE": false,
			"DELETEAuthorities": null
		},
		"events": {
			"beforeInsert": null,
			"beforeUpdate": null,
			"beforeDelete": null,
			"afterInsert": null,
			"afterUpdate": null,
			"afterDelete": null,
			"onNavigate": null,
			"onGetData": null
		},
		"defaultValues": {
			"id": null,
			"email": null,
			"name": null,
			"login": null,
			"picture": null,
			"password": null,
			"theme": null
		},
		"security": {
			"id": null,
			"email": null,
			"name": null,
			"login": null,
			"picture": null,
			"password": null,
			"theme": null
		},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/query/tenant/"
	}<#if (enterprise)!false >,
  "auditlogquery": {
    "customId": "auditlogquery",
    "queryName": "{{AUDIT_LOG}}",
    "sourceType": "entityFullName",
    "baseEntity": null,
    "blockly": null,
    "entitySimpleName": "AuditLog",
    "entityFullName": "app.entity.AuditLog",
    "query": {
      "isValid": true,
      "rulesEntity": [
        {
          "entity": "AuditLog",
          "alias": "a",
          "namespace": "app.entity.AuditLog"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "a"
        }
      ],
      "rulesGroupBy": [],
      "rulesHaving": [],
      "rulesOrderBy": [],
      "rules": {
        "condition": "AND",
        "not": false,
        "valid": true,
        "rules": []
      }
    },
    "queryParamsValues": [],
    "verbs": {
      "GET": false,
      "GETAuthorities": null,
      "POST": false,
      "POSTAuthorities": null,
      "PUT": false,
      "PUTAuthorities": null,
      "DELETE": false,
      "DELETEAuthorities": null,
      "FILTER": false,
      "FILTERAuthorities": null,
      "COUNT": false,
      "COUNTAuthorities": null
    },
    "events": {
      "beforeInsert": null,
      "beforeUpdate": null,
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onGetData": null
    },
    "defaultValues": {
      "id": null,
      "type": null,
      "command": null,
      "date": null,
      "objectData": null,
      "user": null,
      "host": null,
      "agent": null,
      "server": null,
      "affectedFields": null
    },
    "defaultValuesProperties": {
      "id": null,
      "type": null,
      "command": null,
      "date": null,
      "objectData": null,
      "user": null,
      "host": null,
      "agent": null,
      "server": null,
      "affectedFields": null
    },
    "security": {
      "id": null,
      "type": null,
      "command": null,
      "date": null,
      "objectData": null,
      "user": null,
      "host": null,
      "agent": null,
      "server": null,
      "affectedFields": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/auditlogquery/",
    "audit": false
  }</#if>
}