FROM node:6-alpine

# Home directory for Node-RED application source code.
RUN mkdir -p /data/appdata



# package.json contains Node-RED NPM module and node dependencies
#COPY package.json /
RUN npm install node-red -g

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
#ENV NODE_PATH=/usr/src/node-red/node_modules:/data/appdata/node_modules

CMD ["node-red", "--", "--userDir", "/data/appdata"]