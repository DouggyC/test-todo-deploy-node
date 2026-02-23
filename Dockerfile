# Stage 1: build TypeScript
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /usr/src/app

# Copy package files and tsconfig
COPY package*.json tsconfig.json ./

# Install dev dependencies for building
RUN npm install

# Copy all source files
COPY . .

# Build TypeScript to JS (output in /dist)
RUN npm run build

# Stage 2: production image
FROM node:20-alpine

WORKDIR /usr/src/app

# Install only production dependencies
COPY package*.json ./
RUN npm install --production

# Copy compiled JS from builder
COPY --from=builder /usr/src/app/dist ./dist

# Expose port
EXPOSE 3000

# Run the app
CMD ["node", "dist/index.js"]