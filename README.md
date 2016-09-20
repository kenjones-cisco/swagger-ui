# Containerized Swagger UI

Provides Swagger UI for an application that leverages [Swaggerize](https://github.com/krakenjs/swaggerize-express) as the basis for the application. The framework exposes the swagger spec for the application at endpoint `/api-docs`.


[Nginx](https://hub.docker.com/_/nginx/): nginx-1.10-alpine
[SwaggerUI](https://github.com/swagger-api/swagger-ui): v2.2.3

To customize the path to load an application swagger spec:

```bash
git clone https://github.com/kenjones-cisco/swagger-ui
SPEC_PATH=/myapp/api-docs docker build -t myapp/swagger-ui .
docker push myapp/swagger-ui
```

