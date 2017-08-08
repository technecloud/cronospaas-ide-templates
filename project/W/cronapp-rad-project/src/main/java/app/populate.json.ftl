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
    "id": "304BF43E-0E62-4F4A-8A63-3F22D7AD4611",
    "name": "admin",
    "login": "admin",
    "password": "$2a$10$LjzpM1Q3VoAtG2dTCCabNuW0/amVPjL3Iyvyi2Dj7NP.HngtzSewu"
  <#if multitenant?? && multitenant?lower_case == "sim">
    ,"company": { "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD4611"}
  </#if>
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
  </#if>
  {
    "_class": "app.entity.Role",
    "id": "404BF43E-0000-4F4A-8A63-3F22D7AD6556",
    "name": "{{ROLE_ADMIN_NAME}}"
  },
  <#if multitenant?? && multitenant?lower_case == "sim">
  {
    "_class": "app.entity.UserRole",
    "id": "001BF43E-0E62-4F4A-8A63-3F22D7AD6556",
    "user": { "id" : "001BF43E-0E62-4F4A-8A63-3F22D7AD4611" } ,
    "role": { "id" : "404BF43E-0000-4F4A-8A63-3F22D7AD6556" }
  },
  </#if>
  {
    "_class": "app.entity.UserRole",
    "id": "404BF43E-0E62-4F4A-8A63-3F22D7AD6556",
    "user": { "id" : "304BF43E-0E62-4F4A-8A63-3F22D7AD4611" } ,
    "role": { "id" : "404BF43E-0000-4F4A-8A63-3F22D7AD6556" }
  }
]