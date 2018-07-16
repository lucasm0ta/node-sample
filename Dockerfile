FROM node:8.9.3-alpine

ARG NODE_ENV=test
ENV NODE_ENV=$NODE_ENV
ENV PORT=8080

# Set a working directory
WORKDIR /usr/src/app

# Install native dependencies
# RUN set -ex; \
#   apk add --no-cache ...

# Install Node.js dependencies
COPY package*.json ./
RUN npm install

# Copy application files
COPY seeds ./seeds/
COPY public ./public

# Attempts to copy "build" folder even if it doesn't exist
COPY .env build* ./build/

# Run the container under "node" user by default
USER node

COPY . .

EXPOSE 8080
EXPOSE 9229
EXPOSE 9226
CMD [ "npm", "run", "debug" ]
