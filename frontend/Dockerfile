FROM node:lts-alpine AS build

WORKDIR code
COPY ./src/ .
RUN npm install
RUN npm run build

FROM nginx:alpine AS run
COPY --from=build /code/dist/ /usr/share/nginx/html/
COPY ./default.conf /etc/nginx/conf.d/default.conf