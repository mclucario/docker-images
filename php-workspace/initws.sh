#!/bin/bash

echo '========== Workspace StartUp =========='

export NODE_ENABLED="${NODE_ENABLED:-false}"
export NODE_VERSION="${NODE_VERSION:-11.0.0}"
export BOWER_ENABLED="${BOWER_ENABLED:-false}"
export BOWER_VERSION="${BOWER_VERSION:-latest}"
export WEBPACK_ENABLED="${WEBPACK_ENABLED:-false}"
export WEBPACK_VERSION="${WEBPACK_VERSION:-latest}"
export WEBPACK_CLI_VERSION="${WEBPACK_CLI_VERSION:-latest}"

echo "Node Version        : $NODE_VERSION"
echo "Bower Version       : $BOWER_VERSION"
echo "Webpack Version     : $WEBPACK_VERSION"
echo "Webpack CLI Version : $WEBPACK_CLI_VERSION"

if [ $NODE_ENABLED = true ] ; then
    echo '==========  Installing Node  =========='

    export NVM_DIR="/opt/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    nvm install $NODE_VERSION
    nvm use $NODE_VERSION

    if [ $BOWER_ENABLED = true ] ; then
        echo '==========  Installing Bower  =========='
        npm install -g bower@$BOWER_VERSION;
    else
        echo "Bower Disabled"
    fi

    if [ $WEBPACK_ENABLED = true ] ; then
        echo '========== Installing Webpack =========='
        npm install -g webpack@$WEBPACK_VERSION webpack-cli@$WEBPACK_CLI_VERSION
    else
        echo "Webpack Disabled"
    fi

else
    echo "Node Disabled"
fi

echo '==========        DONE        =========='

finish()
{
    exit
}
trap finish SIGINT

while :; do
    sleep 5
done