## 1. Specify base image or sdk image
FROM node:12

## 2. Create app directory
WORKDIR /usr/src/app

## 3. Copy files which contains project dependencies
COPY package*.json ./

## 4. Restore Dependencies
RUN npm install

## 5. Copy all source codes from application/microservice
COPY . ./

## 6. Bundle app source
RUN npm ci

#######################################
## Build Completed
#######################################

## 1. Sepcify Runtime image

## 2. Sepcify Work directory
# WORKDIR /app

## 3. Copy build output from build environment
# COPY --from=build-env /app/out .

## 4. Expose application port
EXPOSE 8080 8080

## 5. Start application using CMD or ENTRYPOINT
ENTRYPOINT ["node", "server.js"]

