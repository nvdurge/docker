FROM node:16.17.1 as node
WORKDIR /app
COPY . .
RUN npm install

RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/meanfrontend/ /usr/share/nginx/html
