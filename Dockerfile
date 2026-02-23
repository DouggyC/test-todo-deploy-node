# Stage 1: build
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

# Copy package files and tsconfig
COPY package*.json tsconfig.json ./

# Install all dependencies
RUN npm install

# Copy all source
COPY . .

# Build TypeScript
RUN npm run build

# Stage 2: production image
FROM node:20-alpine

WORKDIR /usr/src/app

# Copy only production dependencies
COPY package*.json ./
RUN npm install --production

# Copy compiled JS from builder
COPY --from=builder /usr/src/app/dist ./dist

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "dist/index.js"]