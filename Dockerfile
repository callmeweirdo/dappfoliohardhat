# Use the official Node.js image as a base
FROM node:22-alpine

# Set working directory
WORKDIR /dappfoliohardhat

# Copy package.json and package-lock.json first to optimize Docker cache
COPY package*.json ./

# Install dependencies, including Hardhat locally
RUN npm install --omit=dev && npm install hardhat

# Copy the rest of your application code
COPY . .

# Ensure Hardhat scripts have execution permission
RUN chmod +x scripts/*.sh || true

# Create a non-root user for security
RUN adduser -D hardhatuser
USER hardhatuser

# Expose the Hardhat network port
EXPOSE 8545

# Start the Hardhat node
CMD ["npx", "hardhat", "node"]
