# Node.js Application Dockerfile
FROM node:latest

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code from source to the working directory
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]