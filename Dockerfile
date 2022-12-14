FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@8.19.2
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html