# Use official Node LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files first to leverage caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy app source
COPY . .

# Expose port (the same your Node app listens on, e.g., 3000)
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]