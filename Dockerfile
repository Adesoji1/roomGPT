# # Stage 1: Install dependencies
# FROM node:20-alpine AS deps
# WORKDIR /app

# # Copy package.json and package-lock.json
# COPY package.json package-lock.json* ./

# # Install dependencies
# RUN npm ci

# # Stage 2: Build the application
# FROM node:20-alpine AS builder
# WORKDIR /app

# # Copy dependencies from deps stage
# COPY --from=deps /app/node_modules ./node_modules

# # Copy the rest of your application code
# COPY . .

# # Build the Next.js application
# RUN npm run build

# # Stage 3: Production image
# FROM node:20-alpine AS runner
# WORKDIR /app

# # Set environment variable
# ENV NODE_ENV=production

# # Copy the built application from the builder stage
# COPY --from=builder /app/.next/standalone ./
# COPY --from=builder /app/.next/static ./.next/static

# # Copy the public folder for static assets
# COPY --from=builder /app/public ./public

# # Expose port 3000
# EXPOSE 3000

# # Start the application
# CMD ["node", "server.js"]


# Dockerfile

# Stage 1: Install dependencies
FROM node:20-bullseye-slim AS deps
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm ci

# Stage 2: Build the application
FROM node:20-bullseye-slim AS builder
WORKDIR /app

# Copy dependencies from deps stage
COPY --from=deps /app/node_modules ./node_modules

# Copy the rest of your application code
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 3: Production image
FROM node:20-bullseye-slim AS runner
WORKDIR /app

# Set environment variable
ENV NODE_ENV=production

# Copy necessary files from builder
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/package.json ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/.next/standalone ./

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
