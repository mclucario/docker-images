#!/bin/bash

export NODE_VERSION="${NODE_VERSION:-11.0.0}"
export BOWER_VERSION="${BOWER_VERSION:-latest}"
export WEBPACK_VERSION="${WEBPACK:-latest}"
export WEBPACK_CLI_VERSION="${WEBPACK_CLI:-latest}"

nvm install $NODE_VERSION
alias node=/versions/node/v$NODE_VERSION/bin/node
/opt/nvm/versions/node/v$NODE_VERSION/bin/npm install -g bower@$BOWER_VERSION; \
/opt/nvm/versions/node/v$NODE_VERSION/bin/npm install -g webpack@$WEBPACK_VERSION webpack-cli@$WEBPACK_CLI_VERSION