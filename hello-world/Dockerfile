FROM node:14 AS build-stage

ARG NODE_ENV
ARG REACT_APP_OWNER

WORKDIR /app
COPY . .
RUN npm run build

# Second Stage
FROM node:14

LABEL version="1.0.0"
LABEL maintainer = ['kavi']

# Environment Variabes
ENV REACT_APP_OWNER='no_one'

WORKDIR /app
COPY package.json ./

RUN npm install
COPY --from=build-stage /app/public /app/public
COPY --from=build-stage /app/src /app/src

EXPOSE 80 3000
ENTRYPOINT ["npm","start"]