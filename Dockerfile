FROM alpine AS builder
WORKDIR /app
RUN apk add --no-cache --update nodejs npm
COPY package.json package-lock.json ./
RUN npm ci

FROM alpine
WORKDIR /app
RUN apk add --no-cache --update nodejs npm
COPY --from=builder /app/node_modules ./node_modules
COPY . .
CMD [ "npm", "start" ]
