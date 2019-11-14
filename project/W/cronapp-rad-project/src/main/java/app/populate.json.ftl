[
  <#if multitenant?? && multitenant?lower_case == "sim">
  {
    "_class": "app.entity.Company",
    "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD4611",
    "name": "Techne"
  },
  {
    "_class": "app.entity.Company",
    "id": "002BF43E-0E62-4F4A-8A63-3F22D7AD4611",
    "name": "Microsoft"
  },
  </#if>
  {
    "_class": "app.entity.User",
    "id": "1d4e5d7b-dca8-4a1d-90fd-72648cf5dc8d",
    "name": "Administrator",
    "userName": "admin",
    "normalizedUserName": "admin",
    "email": "admin@cronapp.io",
    "normalizedEmail": "admin@cronapp.io",
    "emailConfirmed": true,
    "password": "$2a$10$LjzpM1Q3VoAtG2dTCCabNuW0/amVPjL3Iyvyi2Dj7NP.HngtzSewu",
    "securityStamp": "972d8d0d-66b7-4638-8fdc-74845fba68a5",
    "phoneNumber": "+55 11 00000-0000",
    "phoneNumberConfirmed": true,
    "twoFactorEnabled": true,
    "lockoutEnabled": false,
    "accessFailedCount": 0
  <#if multitenant?? && multitenant?lower_case == "sim">
    ,"company": { "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD4611"}
  </#if>
  },
  {
    "_class": "app.entity.Role",
    "id": "2446125d-abeb-4d14-a630-422eecf18da6",
    "name": "Administrators",
    "normalizedName": "administrators",
    "membershipEnabled": true,
    "builtin": true
  },
  <#if multitenant?? && multitenant?lower_case == "sim">
  {
    "_class": "app.entity.User",
    "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD4611",
    "name": "billgates",
    "login": "billgates",
    "password": "$2a$10$LjzpM1Q3VoAtG2dTCCabNuW0/amVPjL3Iyvyi2Dj7NP.HngtzSewu",
    "company": { "id": "002BF43E-0E62-4F4A-8A63-3F22D7AD4611"}
  },
  {
    "_class": "app.entity.UserRole",
    "id": "f6dff76e-6460-4abc-b55b-7fef96716d18",
    "user": {
      "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD4611"
    },
    "role": {
      "id": "2446125d-abeb-4d14-a630-422eecf18da6"
    }
  }  
  </#if>
  <#if (enterprise)!false >
  {
    "_class": "app.entity.Role",
    "id": "9e2affd5-b4c3-4464-8188-459f87ec2f33",
    "name": "Anonymous Users",
    "normalizedName": "anonymous users",
    "membershipEnabled": false,
    "builtin": true
  },
  {
    "_class": "app.entity.Role",
    "id": "423cca38-7203-4d41-859d-71a5069df3ff",
    "name": "Authenticated Users",
    "normalizedName": "authenticated users",
    "membershipEnabled": false,
    "builtin": true
  },
  {
    "_class": "app.entity.Securable",
    "id": "67574137-a038-4783-9e2d-43ca3fb51635",
    "name": "Public",
    "type": "view",
    "pattern": "/auth/**,/index.html,/favicon.ico,/public/**,/plugins/**,/components/**,/js/**,/lib/**,/css/**,/img/**,/i18n/**,/views/login.view.html,/views/error/**,/views/public/**,/signin/**,/device/**,/api/cronapi/**"
  },
  {
    "_class": "app.entity.Securable",
    "id": "cf2e4e05-c7ce-4333-b7bc-3fd20ee5a137",
    "name": "Authenticated",
    "type": "view",
    "pattern": "/views/logged/**,/api/rest/**,/changePassword,/changeTheme"
  },
  {
    "_class": "app.entity.Securable",
    "id": "0ef7a690-5b5b-41f6-9abe-7fe0cadb5962",
    "name": "Administrators",
    "type": "view",
    "pattern": "/views/admin/**,/api/security/**"
  },
  {
    "_class": "app.entity.RoleSecurable",
    "id": "8481c167-3752-4eca-9991-8087bd5fd14e",
    "role": {
      "id": "9e2affd5-b4c3-4464-8188-459f87ec2f33"
    },
    "securable": {
      "id": "67574137-a038-4783-9e2d-43ca3fb51635"
    }
  },
  {
    "_class": "app.entity.RoleSecurable",
    "id": "3d556d78-8705-4dc4-953b-b91c0d981cea",
    "role": {
      "id": "423cca38-7203-4d41-859d-71a5069df3ff"
    },
    "securable": {
      "id": "cf2e4e05-c7ce-4333-b7bc-3fd20ee5a137"
    }
  },
  {
    "_class": "app.entity.RoleSecurable",
    "id": "2a294fcc-8e73-4b1c-825b-eb56a2bb2fa2",
    "role": {
      "id": "2446125d-abeb-4d14-a630-422eecf18da6"
    },
    "securable": {
      "id": "0ef7a690-5b5b-41f6-9abe-7fe0cadb5962"
    }
  },
  </#if>
  {
    "_class": "app.entity.UserRole",
    "id": "f6dff76e-6460-4abc-b55b-7fef96716d18",
    "user": {
      "id": "1d4e5d7b-dca8-4a1d-90fd-72648cf5dc8d"
    },
    "role": {
      "id": "2446125d-abeb-4d14-a630-422eecf18da6"
    }
  }
]