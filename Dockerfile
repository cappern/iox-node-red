FROM node:latest

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

WORKDIR /usr/src/node-red

RUN apt-get update
RUN apt-get install -y libavahi-compat-libdnssd-dev
RUN apt-get clean
# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/appdata/node_modules

CMD ["npm", "start", "--", "--userDir", "/data/appdata"]