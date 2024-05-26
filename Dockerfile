# Builder stage
FROM node:14-alpine as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run test

# Application stage
FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app/node_modules /app/node_modules
EXPOSE 3000
CMD ["node", "app.js"]  # Adjust the startup command as needed
