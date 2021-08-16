#!/bin/bash
set -ueE -o pipefail

# Because the latest npm version that node 0.6 and 0.9 support, doesn't support scoped modules, so it uses node 0.8 to install npm packages and then switches back.

# SCRIPT
#
# install:
#   - eval "$(curl -fsSL https://gist.githubusercontent.com/sambacha/ece2fe5a48995e598560402e0f907e17/raw/b961edbb66d16a0f5e03310a37cf989433839b3c/travisci-node-npm-install.bash)"

# TRAVIS ENVIRONMENT VARIABLES

# TRAVIS_NODE_VERSION

if [ "${NODE_VERSION}" = "0.6" ] || [ "${NODE_VERSION}" = "0.9" ]; then
	set +u && nvm install --latest-npm 0.8 && npm install && nvm use "${TRAVIS_NODE_VERSION}" && set -u
else
	npm install
fi

# while our scripts pass linting, other scripts may not
# /home/travis/.travis/job_stages: line 81: secure: unbound
set +u
