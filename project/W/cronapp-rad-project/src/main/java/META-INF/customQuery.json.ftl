{
    <#if mutual?? && mutual?lower_case == "sim">
    "keyManager" : {
        "customId": "userProviderKey",
        "queryName": "Obter Usuário por ProviderKey",
        "sourceType": "entityFullName",
        "baseEntity": null,
        "blockly": null,
        "entitySimpleName": "Login",
        "entityFullName": "app.entity.Login",
        "query": {
          "isValid": true,
          "isEmpty": false,
          "operationType": "object",
          "type": "select",
          "rulesEntity": [
            {
              "entity": "Login",
              "namespace": "app.entity.Login",
              "alias": "l"
            }
          ],
          "rulesSelect": [
            {
              "func": "get",
              "field": "l",
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
                "id": "l.loginProvider",
                "field": "l.loginProvider",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":loginProvider",
                "valueIsField": false
              },
              {
                "id": "l.providerKey",
                "field": "l.providerKey",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":providerKey",
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
            "fieldName": "loginProvider",
            "fieldValue": ""
          },
          {
            "fieldName": "providerKey",
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
          "onGetData": null,
          "onError": null
        },
        "defaultValues": {
          "id": null,
          "loginProvider": null,
          "providerDisplayName": null,
          "providerKey": null,
          "user": null
        },
        "defaultValuesProperties": {
          "id": null,
          "loginProvider": null,
          "providerDisplayName": null,
          "providerKey": null,
          "user": null
        },
        "security": {
          "id": null,
          "loginProvider": null,
          "providerDisplayName": null,
          "providerKey": null,
          "user": null
        },
        "calcFields": {},
        "calcFieldsSecurity": {},
        "calcFieldsProperties": {},
        "errorHandles": {
          "primaryKey": null,
          "foreignKey": null
        },
        "serviceUrl": "api/cronapi/odata/v2/app/keyManager/",
        "audit": false
    },
    </#if>
<#noparse>
  "auditlogquery": {
    "customId": "auditlogquery",
    "queryName": "Auditoria em Log",
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
          "alias": "u",
          "name": "UserSecurable"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "u.securable",
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
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "u.securable.application",
                "field": "u.securable.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "u.securable.application.id",
                "field": "u.securable.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
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
      },
      {
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
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
    "serviceUrl": "api/cronapi/odata/v2/app/userSecurables/",
    "audit": false
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
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "r.role.application",
                "field": "r.role.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "r.role.application.id",
                "field": "r.role.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "r.securable.application",
                "field": "r.securable.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "r.role.application.id",
                "field": "r.role.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
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
      },
      {
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
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
    "serviceUrl": "api/cronapi/odata/v2/app/roleSecurables/",
    "audit": false
  },
  "securables": {
    "customId": "securables",
    "queryName": "Securables",
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
            "condition": "OR",
            "rules": [
              {
                "id": "s.application",
                "field": "s.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "s.application.id",
                "field": "s.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "name": null,
      "application": null
    },
    "defaultValuesProperties": {
      "id": null,
      "name": null,
      "application": null
    },
    "security": {
      "id": null,
      "name": null,
      "application": null
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
  "securableViews": {
    "customId": "securableViews",
    "queryName": "Obter Views do Permissionável",
    "sourceType": "entityFullName",
    "baseEntity": null,
    "blockly": null,
    "entitySimpleName": "View",
    "entityFullName": "app.entity.View",
    "query": {
      "isValid": true,
      "isEmpty": false,
      "operationType": "object",
      "type": "select",
      "rulesEntity": [
        {
          "entity": "View",
          "namespace": "app.entity.View",
          "alias": "v",
          "name": "View"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "v",
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
            "id": "v.securable.name",
            "field": "v.securable.name",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":securableName",
            "valueIsField": false
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "v.securable.application",
                "field": "v.securable.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "v.securable.application.id",
                "field": "v.securable.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "v.application",
                "field": "v.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "v.application.id",
                "field": "v.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
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
        "fieldName": "securableName",
        "fieldValue": ""
      },
      {
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "securable": null,
      "pattern": null,
      "getMethodAllowed": null,
      "headMethodAllowed": null,
      "putMethodAllowed": null,
      "postMethodAllowed": null,
      "patchMethodAllowed": null,
      "deleteMethodAllowed": null,
      "optionsMethodAllowed": null,
      "traceMethodAllowed": null,
      "application": null
    },
    "defaultValuesProperties": {
      "id": null,
      "securable": null,
      "pattern": null,
      "getMethodAllowed": null,
      "headMethodAllowed": null,
      "putMethodAllowed": null,
      "postMethodAllowed": null,
      "patchMethodAllowed": null,
      "deleteMethodAllowed": null,
      "optionsMethodAllowed": null,
      "traceMethodAllowed": null,
      "application": null
    },
    "security": {
      "id": null,
      "securable": null,
      "pattern": null,
      "getMethodAllowed": null,
      "headMethodAllowed": null,
      "putMethodAllowed": null,
      "postMethodAllowed": null,
      "patchMethodAllowed": null,
      "deleteMethodAllowed": null,
      "optionsMethodAllowed": null,
      "traceMethodAllowed": null,
      "application": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/securableViews/",
    "audit": false
  },
  "auth": {
    "customId": "auth",
    "queryName": "Autenticar",
    "sourceType": "entityFullName",
    "baseEntity": null,
    "blockly": null,
    "entitySimpleName": "User",
    "entityFullName": "app.entity.User",
    "query": {
      "isEmpty": true,
      "isRawSql": true,
      "sqlContent": "select u \nfrom User u \nwhere u.normalizedUserName \u003d :login \n  and (\n        exists(select ur\n               from UserRole ur\n               where ur.user.normalizedUserName \u003d u.normalizedUserName\n                 and exists(select rs\n                            from RoleSecurable rs\n                            where rs.role.normalizedName \u003d ur.role.normalizedName\n                              and rs.securable.name \u003d \u0027Administrators\u0027))\n       or \n       exists(select au from ApplicationUser au \n              where au.application.id \u003d :applicationId \n                and au.user.normalizedUserName \u003d u.normalizedUserName)\n  )",
      "multiTenant": false,
      "paginatorAutomatic": false,
      "pagination": false
    },
    "queryParamsValues": [
      {
        "fieldName": "login",
        "fieldValue": ""
      },
      {
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
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
      "userName": null,
      "theme": null,
      "picture": null
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
      "userName": null,
      "theme": null,
      "picture": null
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
      "userName": null,
      "theme": null,
      "picture": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/auth/",
    "audit": false
  },
  "roles": {
    "customId": "roles",
    "queryName": "Obter Autorização",
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
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "u.role.application",
                "field": "u.role.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              },
              {
                "id": "u.role.application.id",
                "field": "u.role.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              }
            ],
            "not": false
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
      },
      {
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
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
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "defaultValuesProperties": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "security": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/roles/",
    "audit": false
  },
  "device": {
    "customId": "device",
    "queryName": "Atualizar Dispositivos",
    "screen": "",
    "sourceType": "entityFullName",
    "blockly": null,
    "entitySimpleName": "Device",
    "entityFullName": "app.entity.Device",
    "query": {
      "isValid": true,
      "isEmpty": false,
      "operationType": "object",
      "type": "select",
      "rulesEntity": [
        {
          "entity": "Device",
          "namespace": "app.entity.Device",
          "alias": "d"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "d",
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
            "id": "d.id",
            "field": "d.id",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":id",
            "valueIsField": false
          }
        ],
        "not": false,
        "valid": true
      },
      "isRawSql": false,
      "multiTenant": true,
      "paginatorAutomatic": false
    },
    "queryParamsValues": [
      {
        "fieldName": "id",
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
      "token": null
    },
    "security": {
      "id": null,
      "token": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/query/1jy88nt41afza/"
  },
  "roleManager": {
    "customId": "roleManager",
    "queryName": "Gerenciador de Papéis",
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
          "entity": "Role",
          "namespace": "app.entity.Role",
          "alias": "r"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "r",
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
            "id": "r.membershipEnabled",
            "field": "r.membershipEnabled",
            "type": "boolean",
            "input": "text",
            "operator": "equal",
            "value": "true",
            "valueIsField": false
          },
          {
            "condition": "OR",
            "rules": [
              {
                "id": "r.application.id",
                "field": "r.application.id",
                "type": "string",
                "input": "text",
                "operator": "equal",
                "value": ":applicationId",
                "valueIsField": false
              },
              {
                "id": "r.application",
                "field": "r.application",
                "type": "string",
                "input": "text",
                "operator": "is_null",
                "value": null,
                "valueIsField": false
              }
            ],
            "not": false
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
      }
    ],
    "verbs": {
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": {
        "type": "server",
        "blocklyMethod": "BeforeInsert",
        "blocklyClass": "blockly.RoleManager",
        "blocklyLanguage": "java",
        "blocklyParams": [
          {
            "name": "Entidade\u0026lt;app.entity.Role\u0026gt;",
            "value": "data",
            "type": "CUSTOM"
          }
        ],
        "blocklyJson": {
          "namespace": "blockly.RoleManager",
          "sourcePath": "src/main/java/blockly/RoleManager.blockly",
          "language": "java",
          "methods": [
            {
              "name": "BeforeInsert",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            },
            {
              "name": "BeforeUpdate",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            },
            {
              "name": "Normalize",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            }
          ]
        }
      },
      "beforeUpdate": {
        "type": "server",
        "blocklyMethod": "BeforeUpdate",
        "blocklyClass": "blockly.RoleManager",
        "blocklyLanguage": "java",
        "blocklyParams": [
          {
            "name": "Entidade\u0026lt;app.entity.Role\u0026gt;",
            "value": "data",
            "type": "CUSTOM"
          }
        ],
        "blocklyJson": {
          "namespace": "blockly.RoleManager",
          "sourcePath": "src/main/java/blockly/RoleManager.blockly",
          "language": "java",
          "methods": [
            {
              "name": "BeforeInsert",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            },
            {
              "name": "BeforeUpdate",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            },
            {
              "name": "Normalize",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.Role\u0026gt;"
              ]
            }
          ]
        }
      },
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "defaultValuesProperties": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "security": {
      "id": null,
      "builtIn": null,
      "membershipEnabled": null,
      "name": null,
      "normalizedName": null,
      "application": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/roleManager/",
    "audit": true
  },
  "userManager": {
    "customId": "userManager",
    "queryName": "Gerenciador de Usuários",
    "sourceType": "entityFullName",
    "baseEntity": null,
    "blockly": null,
    "entitySimpleName": "User",
    "entityFullName": "app.entity.User",
    "query": {
      "isValid": true,
      "rulesEntity": [
        {
          "entity": "User",
          "alias": "u",
          "namespace": "app.entity.User"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "u"
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
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": {
        "type": "server",
        "blocklyMethod": "BeforeInsert",
        "blocklyClass": "blockly.UserManager",
        "blocklyLanguage": "java",
        "blocklyParams": [
          {
            "name": "Entidade\u0026lt;app.entity.User\u0026gt;",
            "value": "data",
            "type": "CUSTOM"
          }
        ],
        "blocklyJson": {
          "namespace": "blockly.UserManager",
          "sourcePath": "src/main/java/blockly/UserManager.blockly",
          "language": "java",
          "methods": [
            {
              "name": "Normalize",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            },
            {
              "name": "BeforeUpdate",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            },
            {
              "name": "BeforeInsert",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            }
          ]
        }
      },
      "beforeUpdate": {
        "type": "server",
        "blocklyMethod": "BeforeUpdate",
        "blocklyClass": "blockly.UserManager",
        "blocklyLanguage": "java",
        "blocklyParams": [
          {
            "name": "Entidade\u0026lt;app.entity.User\u0026gt;",
            "value": "data",
            "type": "CUSTOM"
          }
        ],
        "blocklyJson": {
          "namespace": "blockly.UserManager",
          "sourcePath": "src/main/java/blockly/UserManager.blockly",
          "language": "java",
          "methods": [
            {
              "name": "Normalize",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            },
            {
              "name": "BeforeUpdate",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            },
            {
              "name": "BeforeInsert",
              "hasReturn": "true",
              "params": [
                "Entidade\u0026lt;app.entity.User\u0026gt;"
              ]
            }
          ]
        }
      },
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
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
      "userName": null,
      "theme": null,
      "picture": null
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
      "userName": null,
      "theme": null,
      "picture": null
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
      "userName": null,
      "theme": null,
      "picture": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/userManager/",
    "audit": true
  },
  "userRoleManager": {
    "customId": "userRoleManager",
    "queryName": "Gerenciador de Papéis de Usuários",
    "sourceType": "entityFullName",
    "baseEntity": null,
    "blockly": null,
    "entitySimpleName": "UserRole",
    "entityFullName": "app.entity.UserRole",
    "query": {
      "isValid": true,
      "isEmpty": false,
      "operationType": "object",
      "type": "select",
      "rulesEntity": [
        {
          "entity": "UserRole",
          "namespace": "app.entity.UserRole",
          "alias": "ur"
        }
      ],
      "rulesSelect": [
        {
          "func": "get",
          "field": "ur",
          "type": "string"
        }
      ],
      "rulesGroupBy": [],
      "rulesHaving": [],
      "rulesOrderBy": [],
      "rules": {
        "condition": "OR",
        "rules": [
          {
            "id": "ur.role.application.id",
            "field": "ur.role.application.id",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":applicationId",
            "valueIsField": false
          },
          {
            "id": "ur.role.application",
            "field": "ur.role.application",
            "type": "string",
            "input": "text",
            "operator": "is_null",
            "value": null,
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
      }
    ],
    "verbs": {
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": null,
      "beforeUpdate": null,
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "role": null,
      "user": null
    },
    "defaultValuesProperties": {
      "id": null,
      "role": null,
      "user": null
    },
    "security": {
      "id": null,
      "role": null,
      "user": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/userRoleManager/",
    "audit": true
  },
  "securableManager": {
    "customId": "securableManager",
    "queryName": "Gerenciador de Permissionáveis",
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
        "condition": "OR",
        "rules": [
          {
            "id": "s.application.id",
            "field": "s.application.id",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":applicationId",
            "valueIsField": false
          },
          {
            "id": "s.application",
            "field": "s.application",
            "type": "string",
            "input": "text",
            "operator": "is_null",
            "value": null,
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
      }
    ],
    "verbs": {
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": null,
      "beforeUpdate": null,
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
    },
    "defaultValues": {
      "id": null,
      "name": null,
      "application": null
    },
    "defaultValuesProperties": {
      "id": null,
      "name": null,
      "application": null
    },
    "security": {
      "id": null,
      "name": null,
      "application": null
    },
    "calcFields": {},
    "calcFieldsSecurity": {},
    "calcFieldsProperties": {},
    "errorHandles": {
      "primaryKey": null,
      "foreignKey": null
    },
    "serviceUrl": "api/cronapi/odata/v2/app/securableManager/",
    "audit": true
  },
  "userSecurableManager": {
    "customId": "userSecurableManager",
    "queryName": "Gerenciador de Permissionáveis de Usuários",
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
          "field": "u",
          "type": "string"
        }
      ],
      "rulesGroupBy": [],
      "rulesHaving": [],
      "rulesOrderBy": [],
      "rules": {
        "condition": "OR",
        "rules": [
          {
            "id": "u.securable.application.id",
            "field": "u.securable.application.id",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":applicationId",
            "valueIsField": false
          },
          {
            "id": "u.securable.application",
            "field": "u.securable.application",
            "type": "string",
            "input": "text",
            "operator": "is_null",
            "value": null,
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
      }
    ],
    "verbs": {
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": null,
      "beforeUpdate": null,
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
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
    "serviceUrl": "api/cronapi/odata/v2/app/userSecurableManager/",
    "audit": true
  },
  "roleSecurableManager": {
    "customId": "roleSecurableManager",
    "queryName": "Gerenciador de Permissionáveis de Papéis",
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
          "field": "r",
          "type": "string"
        }
      ],
      "rulesGroupBy": [],
      "rulesHaving": [],
      "rulesOrderBy": [],
      "rules": {
        "condition": "OR",
        "rules": [
          {
            "id": "r.role.application.id",
            "field": "r.role.application.id",
            "type": "string",
            "input": "text",
            "operator": "equal",
            "value": ":applicationId",
            "valueIsField": false
          },
          {
            "id": "r.role.application",
            "field": "r.role.application",
            "type": "string",
            "input": "text",
            "operator": "is_null",
            "value": null,
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
        "fieldName": "applicationId",
        "fieldValue": "expression:${application.id}"
      }
    ],
    "verbs": {
      "GET": true,
      "GETAuthorities": [
        "Administrators"
      ],
      "POST": true,
      "POSTAuthorities": [
        "Administrators"
      ],
      "PUT": true,
      "PUTAuthorities": [
        "Administrators"
      ],
      "DELETE": true,
      "DELETEAuthorities": [
        "Administrators"
      ],
      "FILTER": true,
      "FILTERAuthorities": [
        "Administrators"
      ],
      "COUNT": true,
      "COUNTAuthorities": [
        "Administrators"
      ]
    },
    "events": {
      "beforeInsert": null,
      "beforeUpdate": null,
      "beforeDelete": null,
      "afterInsert": null,
      "afterUpdate": null,
      "afterDelete": null,
      "onNavigate": null,
      "onError": null
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
    "serviceUrl": "api/cronapi/odata/v2/app/roleSecurableManager/",
    "audit": true
  }
</#noparse>  
}