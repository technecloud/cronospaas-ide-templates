{
	<#if (enterprise)!false >
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
	},
	"userSecurables": {
		"customId": "userSecurables",
		"queryName": "Obter Autorizações do Usuário",
		"sourceType": "entityFullName",
		"baseEntity": null,
		"blockly": null,
		"entitySimpleName": "UserSecurable",
		"entityFullName": "app.entity.UserSecurable",
		"query": {
			"isValid": true,
			"isEmpty": false,
			"operationType": "object",
			"type": "select",
			"rulesEntity": [
				{
					"entity": "UserSecurable",
					"namespace": "app.entity.UserSecurable",
					"alias": "u"
				}
			],
			"rulesSelect": [
				{
					"func": "get",
					"field": "u.securable.pattern",
					"type": "string"
				}
			],
			"rulesGroupBy": [],
			"rulesHaving": [],
			"rulesOrderBy": [],
			"rules": {
				"condition": "AND",
				"rules": [
					{
						"id": "u.user.normalizedUserName",
						"field": "u.user.normalizedUserName",
						"type": "string",
						"input": "text",
						"operator": "equal",
						"value": ":login",
						"valueIsField": false
					}
				],
				"not": false,
				"valid": true
			},
			"isRawSql": false,
			"multiTenant": false,
			"paginatorAutomatic": false,
			"pagination": false
		},
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
			"FILTERAuthorities": null,
			"COUNT": true,
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
			"securable": null,
			"user": null
		},
		"defaultValuesProperties": {
			"id": null,
			"securable": null,
			"user": null
		},
		"security": {
			"id": null,
			"securable": null,
			"user": null
		},
		"calcFields": {},
		"calcFieldsSecurity": {},
		"calcFieldsProperties": {},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/odata/v2/app/userSecurables/"
	},
	"roleSecurables": {
		"customId": "roleSecurables",
		"queryName": "Obter Autorizações do Papel",
		"sourceType": "entityFullName",
		"baseEntity": null,
		"blockly": null,
		"entitySimpleName": "RoleSecurable",
		"entityFullName": "app.entity.RoleSecurable",
		"query": {
			"isValid": true,
			"isEmpty": false,
			"operationType": "object",
			"type": "select",
			"rulesEntity": [
				{
					"entity": "RoleSecurable",
					"namespace": "app.entity.RoleSecurable",
					"alias": "r"
				}
			],
			"rulesSelect": [
				{
					"func": "get",
					"field": "r.securable",
					"type": "string"
				}
			],
			"rulesGroupBy": [],
			"rulesHaving": [],
			"rulesOrderBy": [],
			"rules": {
				"condition": "AND",
				"rules": [
					{
						"id": "r.role.normalizedName",
						"field": "r.role.normalizedName",
						"type": "string",
						"input": "text",
						"operator": "equal",
						"value": ":role",
						"valueIsField": false
					}
				],
				"not": false,
				"valid": true
			},
			"isRawSql": false,
			"multiTenant": false,
			"paginatorAutomatic": false,
			"pagination": false
		},
		"queryParamsValues": [
			{
				"fieldName": "role",
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
			"FILTERAuthorities": null,
			"COUNT": true,
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
			"role": null,
			"securable": null
		},
		"defaultValuesProperties": {
			"id": null,
			"role": null,
			"securable": null
		},
		"security": {
			"id": null,
			"role": null,
			"securable": null
		},
		"calcFields": {},
		"calcFieldsSecurity": {},
		"calcFieldsProperties": {},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/odata/v2/app/roleSecurables/"
	},
    "securables": {
        "customId": "securables",
        "queryName": "Obter Permissionáveis",
        "sourceType": "entityFullName",
        "baseEntity": null,
        "blockly": null,
        "entitySimpleName": "Securable",
        "entityFullName": "app.entity.Securable",
        "query": {
            "isValid": true,
            "isEmpty": false,
            "operationType": "object",
            "type": "select",
            "rulesEntity": [
                {
                    "entity": "Securable",
                    "namespace": "app.entity.Securable",
                    "alias": "s"
                }
            ],
            "rulesSelect": [
                {
                    "func": "get",
                    "field": "s",
                    "type": "string"
                }
            ],
            "rulesGroupBy": [],
            "rulesHaving": [],
            "rulesOrderBy": [],
            "rules": {
                "condition": "AND",
                "rules": [
                    {
                        "id": "s.name",
                        "field": "s.name",
                        "type": "string",
                        "input": "text",
                        "operator": "equal",
                        "value": ":name",
                        "valueIsField": false
                    },
                    {
                        "id": "s.type",
                        "field": "s.type",
                        "type": "string",
                        "input": "text",
                        "operator": "equal",
                        "value": ":type",
                        "valueIsField": false
                    }
                ],
                "not": false,
                "valid": true
            },
            "isRawSql": false,
            "multiTenant": false,
            "paginatorAutomatic": false,
            "pagination": false
        },
        "queryParamsValues": [
            {
                "fieldName": "name",
                "fieldValue": ""
            },
            {
                "fieldName": "type",
                "fieldValue": ""
            }
        ],
        "verbs": {
            "GET": true,
            "GETAuthorities": null,
            "POST": true,
            "POSTAuthorities": null,
            "PUT": true,
            "PUTAuthorities": null,
            "DELETE": true,
            "DELETEAuthorities": null,
            "FILTER": true,
            "FILTERAuthorities": null,
            "COUNT": true,
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
            "name": null,
            "pattern": null,
            "type": null
        },
        "defaultValuesProperties": {
            "id": null,
            "name": null,
            "pattern": null,
            "type": null
        },
        "security": {
            "id": null,
            "name": null,
            "pattern": null,
            "type": null
        },
        "calcFields": {},
        "calcFieldsSecurity": {},
        "calcFieldsProperties": {},
        "errorHandles": {
            "primaryKey": null,
            "foreignKey": null
        },
        "serviceUrl": "api/cronapi/odata/v2/app/securables/",
        "audit": false
    },
	</#if>
	"auth": {
		"customId": "auth",
		"queryName": "{{AUTHENTICATE}}",
		"sourceType": "entityFullName",
		"baseEntity": null,
		"blockly": null,
		"entitySimpleName": "User",
		"entityFullName": "app.entity.User",
		"query": {
			"isValid": true,
			"isEmpty": false,
			"operationType": "object",
			"type": "select",
			"rulesEntity": [
				{
					"entity": "User",
					"namespace": "app.entity.User",
					"alias": "u"
				}
			],
			"rulesSelect": [
				{
					"func": "get",
					"field": "u",
					"type": "string"
				}
			],
			"rulesGroupBy": [],
			"rulesHaving": [],
			"rulesOrderBy": [],
			"rules": {
				"condition": "AND",
				"rules": [
					{
						"id": "u.normalizedUserName",
						"field": "u.normalizedUserName",
						"type": "string",
						"input": "text",
						"operator": "equal",
						"value": ":login",
						"valueIsField": false
					}
				],
				"not": false,
				"valid": true
			},
			"isRawSql": false,
			"multiTenant": false,
			"paginatorAutomatic": false,
			"pagination": false
		},
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
			"FILTERAuthorities": null,
			"COUNT": true,
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
			"accessFailedCount": null,
			"email": null,
			"emailConfirmed": null,
			"lockoutEnabled": null,
			"lockoutEnd": null,
			"name": null,
			"normalizedEmail": null,
			"normalizedUserName": null,
			"password": null,
			"phoneNumber": null,
			"phoneNumberConfirmed": null,
			"securityStamp": null,
			"twoFactorEnabled": null,
			"userName": null
		},
		"defaultValuesProperties": {
			"id": null,
			"accessFailedCount": null,
			"email": null,
			"emailConfirmed": null,
			"lockoutEnabled": null,
			"lockoutEnd": null,
			"name": null,
			"normalizedEmail": null,
			"normalizedUserName": null,
			"password": null,
			"phoneNumber": null,
			"phoneNumberConfirmed": null,
			"securityStamp": null,
			"twoFactorEnabled": null,
			"userName": null
		},
		"security": {
			"id": null,
			"accessFailedCount": null,
			"email": null,
			"emailConfirmed": null,
			"lockoutEnabled": null,
			"lockoutEnd": null,
			"name": null,
			"normalizedEmail": null,
			"normalizedUserName": null,
			"password": null,
			"phoneNumber": null,
			"phoneNumberConfirmed": null,
			"securityStamp": null,
			"twoFactorEnabled": null,
			"userName": null
		},
		"calcFields": {},
		"calcFieldsSecurity": {},
		"calcFieldsProperties": {},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/odata/v2/app/auth/"
	},
	"roles": {
		"customId": "roles",
		"queryName": "{{GET_ROLES}}",
		"sourceType": "entityFullName",
		"baseEntity": null,
		"blockly": null,
		"entitySimpleName": "Role",
		"entityFullName": "app.entity.Role",
		"query": {
			"isValid": true,
			"isEmpty": false,
			"operationType": "object",
			"type": "select",
			"rulesEntity": [
				{
					"entity": "UserRole",
					"namespace": "app.entity.UserRole",
					"alias": "u"
				}
			],
			"rulesSelect": [
				{
					"func": "get",
					"field": "u.role.normalizedName",
					"type": "string"
				}
			],
			"rulesGroupBy": [],
			"rulesHaving": [],
			"rulesOrderBy": [],
			"rules": {
				"condition": "AND",
				"rules": [
					{
						"id": "u.user.normalizedUserName",
						"field": "u.user.normalizedUserName",
						"type": "string",
						"input": "text",
						"operator": "equal",
						"value": ":login",
						"valueIsField": false
					}
				],
				"not": false,
				"valid": true
			},
			"isRawSql": false,
			"multiTenant": false,
			"paginatorAutomatic": false,
			"pagination": false
		},
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
			"FILTERAuthorities": null,
			"COUNT": true,
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
			"builtin": null,
			"membershipEnabled": null,
			"name": null,
			"normalizedName": null
		},
		"defaultValuesProperties": {
			"id": null,
			"builtin": null,
			"membershipEnabled": null,
			"name": null,
			"normalizedName": null
		},
		"security": {
			"id": null,
			"builtin": null,
			"membershipEnabled": null,
			"name": null,
			"normalizedName": null
		},
		"calcFields": {},
		"calcFieldsSecurity": {},
		"calcFieldsProperties": {},
		"errorHandles": {
			"primaryKey": null,
			"foreignKey": null
		},
		"serviceUrl": "api/cronapi/odata/v2/app/roles/"
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
	}
}