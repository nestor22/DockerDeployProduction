FROM node:16-alpine as builderserver


WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . . 

RUN npm run build 

FROM nginx 
COPY --from=builderserver /app/build /usr/share/nginx/html
