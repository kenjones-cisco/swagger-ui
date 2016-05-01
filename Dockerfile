FROM nginx:1.9-alpine

ENV SWAGGER_UI_VERSION "2.1.4"

WORKDIR /etc/nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add --no-cache --virtual .build-deps \
        curl \
        zlib-dev \
    && curl -fSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz -o swagger-ui.tar.gz \
    && tar -zxC /tmp -f swagger-ui.tar.gz swagger-ui-$SWAGGER_UI_VERSION/dist/ \
    && rm swagger-ui.tar.gz \
    && mkdir -p /usr/share/nginx/html/apis \
    && mv /tmp/swagger-ui-$SWAGGER_UI_VERSION/dist/* /usr/share/nginx/html/apis \
    && rm -rf /tmp/swagger-ui-$SWAGGER_UI_VERSION \
    && apk del .build-deps

# replace the default petstore with the APIs exposed via swagger-express of our application
RUN sed -i "s|http://petstore.swagger.io/v2/swagger.json|/v1/api-docs|g" /usr/share/nginx/html/apis/index.html

CMD ["nginx"]
