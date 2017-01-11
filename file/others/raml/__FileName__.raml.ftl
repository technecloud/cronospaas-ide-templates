#%RAML 0.8
---
title: Hello world
baseUri: http://localhost/
version: v1

/hello:
  get:
    responses:
      200:
        body:
          application/json: