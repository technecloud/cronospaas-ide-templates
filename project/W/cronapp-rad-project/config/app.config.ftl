{
  "app": {
    "guid": "${appguid}"
  },
  "odata": {
    "exposeEntities": true,
    "exposeMetadata": false,
    "metadataSecurity": "Administrators"
  },
  "security": {
    "token": "${tokenb64}",
    "tokenExpiration": 3600
  },
  "auth": {
    "type": "${authentication}"
  }
}