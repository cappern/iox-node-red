FROM alpine:3.3

RUN apk add --update nodejs


# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red
#RUN mkdir -p /data/appdata


WORKDIR /usr/src/node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red
COPY settings.js /usr/src/node-red
#COPY config.ini /data

RUN npm install



# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/appdata/node_modules
#ENV CAF_APP_CONFIG_FILE=/data/config.ini
#ENV CAF_APP_APPDATA_DIR /data/appdata



#CMD ["npm", "start" , "--", "--userDir", "/data/appdata", "--settings", "/usr/src/node-red/settings.js"]
CMD ["npm", "start" ,"--prefix", "usr/src/node-red/", "--", "--userDir", "/data/appdata", "--settings", "/usr/src/node-red/settings.js"]