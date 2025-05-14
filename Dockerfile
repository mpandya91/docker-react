FROM node:24-alpine AS builder

WORKDIR /usr/app

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

# /usr/app/dist

FROM nginx
COPY --from=builder /usr/app/dist /usr/share/nginx/html