<#assign administratorUser = "1d4e5d7b-dca8-4a1d-90fd-72648cf5dc8d" >
<#assign administratorsRole = "cdeca4d5-59a5-11eb-95ba-0242ac110002" >
<#assign anonymousUsersRole = statics["java.util.UUID"].randomUUID() >
<#assign authenticatedUsersRole = statics["java.util.UUID"].randomUUID() >
<#assign administratorsSecurable = "fdce3bb0-59a5-11eb-95ba-0242ac110002" >
<#assign publicSecurable = statics["java.util.UUID"].randomUUID() >
<#assign authenticatedSecurable = statics["java.util.UUID"].randomUUID() >
[
  {
    "_class": "app.entity.Application",
    "id": "${appguid}",
    "name": "${appid}"
  },
  {
    "_class": "app.entity.User",
    "id": "${administratorUser}",
    "name": "Administrator",
    "userName": "admin",
    "normalizedUserName": "admin",
    "email": "admin@cronapp.io",
    "normalizedEmail": "admin@cronapp.io",
    "emailConfirmed": true,
    "password": "$2a$10$LjzpM1Q3VoAtG2dTCCabNuW0/amVPjL3Iyvyi2Dj7NP.HngtzSewu",
    "securityStamp": "972d8d0d-66b7-4638-8fdc-74845fba68a5",
    "phoneNumberConfirmed": true,
    "twoFactorEnabled": true,
    "lockoutEnabled": false,
    "accessFailedCount": 0
  },
  {
    "_class": "app.entity.Role",
    "id": "${administratorsRole}",
    "name": "Administrators",
    "normalizedName": "administrators",
    "membershipEnabled": true,
    "builtIn": true
  },
  {
    "id": "${anonymousUsersRole}",
    "name": "Anonymous Users",
    "normalizedName": "anonymous users",
    "membershipEnabled": false,
    "builtIn": false,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.Role"
  },
  {
    "_class": "app.entity.Role",
    "id": "${authenticatedUsersRole}",
    "name": "Authenticated Users",
    "normalizedName": "authenticated users",
    "membershipEnabled": false,
    "application": {
      "id": "${appguid}"
    },
    "builtIn": true
  },
  {
    "id": "${publicSecurable}",
    "name": "Public",
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.Securable"
  },
  {
    "id": "${authenticatedSecurable}",
    "name": "Authenticated",
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.Securable"
  },
  {
    "id": "${administratorsSecurable}",
    "name": "Administrators",
    "_class": "app.entity.Securable"
  },
  {
    "_class": "app.entity.RoleSecurable",
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "role": {
      "id": "${anonymousUsersRole}"
    },
    "securable": {
      "id": "${publicSecurable}"
    }
  },
  {
    "_class": "app.entity.RoleSecurable",
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "role": {
      "id": "${authenticatedUsersRole}"
    },
    "securable": {
      "id": "${authenticatedSecurable}"
    }
  },
  {
    "id": "def2d8a0-5a5c-11eb-bdc9-0242ac110002",
    "role": {
      "id": "${administratorsRole}"
    },
    "securable": {
      "id": "${administratorsSecurable}"
    },
    "_class": "app.entity.RoleSecurable"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${administratorsSecurable}"
    },
    "pattern": "/views/admin/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${administratorsSecurable}"
    },
    "pattern": "/api/security/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/auth/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/index.html",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/favicon.ico",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/public/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/plugins/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/node_modules/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/components/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/js/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/lib/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/css/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/img/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/i18n/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/views/login.view.html",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/views/error/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/views/public/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/signin/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/device/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/api/cronapi/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${authenticatedSecurable}"
    },
    "pattern": "/views/logged/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${authenticatedSecurable}"
    },
    "pattern": "/api/rest/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${authenticatedSecurable}"
    },
    "pattern": "/changePassword",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${authenticatedSecurable}"
    },
    "pattern": "/changeTheme",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/services/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mutual/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/actuator/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/index.html",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/views/login.view.html",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/js/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/node_modules/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/css/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/i18n/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/img/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/views/error/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/favicon.ico",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/views/public/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/bowerscripts/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${publicSecurable}"
    },
    "pattern": "/mobileapp/manifest.json",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "id": "${statics["java.util.UUID"].randomUUID()}",
    "securable": {
      "id": "${authenticatedSecurable}"
    },
    "pattern": "/mobileapp/views/logged/**",
    "getMethodAllowed": true,
    "headMethodAllowed": true,
    "putMethodAllowed": true,
    "postMethodAllowed": true,
    "patchMethodAllowed": true,
    "deleteMethodAllowed": true,
    "optionsMethodAllowed": true,
    "traceMethodAllowed": true,
    "application": {
      "id": "${appguid}"
    },
    "_class": "app.entity.View"
  },
  {
    "_class": "app.entity.UserRole",
    "id": "f6dff76e-6460-4abc-b55b-7fef96716d18",
    "user": {
      "id": "${administratorUser}"
    },
    "role": {
      "id": "${administratorsRole}"
    }
  }
]