# Use official Node.js Alpine base image (lightweight)
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only package files first (to leverage Docker cache)
COPY package*.json ./

# Install dependencies (no devDependencies by default)
RUN npm install --omit=dev

# Copy the rest of the application
COPY . .

# Expose port (used by Express)
EXPOSE 5006

# Start the app
CMD ["node", "server.js"]
