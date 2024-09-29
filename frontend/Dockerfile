FROM node:lts-alpine AS build

WORKDIR code
COPY ./src/ .
RUN mkdir /ssl
RUN npm install
RUN npm run build

FROM nginx:alpine AS run
COPY --from=build /code/dist/ /usr/share/nginx/html/
EXPOSE 80
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/privatekey.pem /ssl/privatekey.pem
COPY ./ssl/fullchain.pem /ssl/fullchain.pem
COPY ./ssl/dhparam-2048.pem /ssl/dhparam-2048.pem
