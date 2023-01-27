#!/usr/bin/env bash
set -x
set -e

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

unset NPM_CONFIG_PREFIX

nvm install 14.17.0
nvm use 14.17.0

cd /opt/open-webapp/
npm ci --unsafe-perm node-sass

cd /opt/open-webapp/
npm run build
