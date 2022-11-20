#!/bin/sh

# Exit script on error
set -e

cmd="$@"

# checking if database file created (SQLite)
until [ -f data/db/data.db ]; do
  echo "Backend not yet started - waiting.."
  sleep 1
done

# Install jq for later JSON use
apt-get update
apt-get install jq -y

# Colors
NOCOLOR='\033[0m'
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
GREENBOLD="\033[1;32m"
CYAN='\033[1;36m'

echo "${CYAN}Backend started - initializing..${NOCOLOR}"

# --------------------
# Create admin account (if not exists)
# --------------------
ADMIN_CREATE=$(curl -s -X POST -H "Content-Type: application/json" -d "{ email: ${BACKEND_ADMIN_EMAIL}, password: ${BACKEND_ADMIN_PASSWORD} }" "${VITE_BACKEND_URL}/api/admins")
ADMIN_CREATE_RES_CODE=$(echo $ADMIN_CREATE | jq -r '.code')

# Admin account already exists
if [ $ADMIN_CREATE_RES_CODE = "401" ]; then
  echo "${YELLOW}Admin account already exists - logging in..${NOCOLOR}";
# Error occured
elif [ $ADMIN_CREATE_RES_CODE != "200" ]; then
  echo "${RED}Creating admin account failed with response:${NOCOLOR}"
  echo $ADMIN_CREATE
  exit 1;
else
  echo "${GREEN}Successfully created admin account - logging in..${NOCOLOR}"
fi

# --------------------
# Login with admin account
# --------------------
ADMIN_LOGIN=$(curl -s -X POST -H "Content-Type: application/json" -d '{ "identity": "'"${BACKEND_ADMIN_EMAIL}"'", "password": "'"${BACKEND_ADMIN_PASSWORD}"'" }' "${VITE_BACKEND_URL}/api/admins/auth-with-password")
ADMIN_TOKEN=$(echo $ADMIN_LOGIN | jq -r '.token')

if [ $ADMIN_TOKEN = "" ]; then
  echo "${RED}Failed admin account authentication with response:${NOCOLOR}"
  echo $ADMIN_LOGIN
  exit 1;
fi

echo "${GREEN}Successfully logged in with admin account - updating structure..${NOCOLOR}"

# --------------------
# Update DB structure
# --------------------
JSON_DATA=$(jq -c . db_schema.json)
UPDATE_STRUCTURE=$(curl -s -X PUT -H "Content-Type: application/json" -H "Authorization: ${ADMIN_TOKEN}" -d '{"collections": '"$JSON_DATA"' }' "${VITE_BACKEND_URL}/api/collections/import")

# On success respond is null (so checking for not null response)
if [ $UPDATE_STRUCTURE ]; then
  echo "${RED}Failed to update database structure with response:${NOCOLOR}"
  echo $UPDATE_STRUCTURE
  exit 1;
fi

echo "${GREEN}Successfully updated database structure - updating settings..${NOCOLOR}"

# --------------------
# Update settings and OAuth providers
# --------------------
SETTINGS='{
  "meta": {
      "appName": "AquaHub",
      "appUrl": "'"${VITE_BACKEND_URL}"'"
  },
  "googleAuth": {
    "enabled": true,
    "clientId": "'"${GOOGLE_CLIENT_ID}"'"
    "clientSecret": "'"${GOOGLE_CLIENT_SECRET}"'"
  }
  },
  "githubAuth": {
    "enabled": true,
    "clientId": "'"${GITHUB_CLIENT_ID}"'"
    "clientSecret": "'"${GITHUB_CLIENT_SECRET}"'"
  }
}'

UPDATE_SETTINGS=$(curl -s -X PATCH -H "Content-Type: application/json" -H "Authorization: ${ADMIN_TOKEN}" -d "$SETTINGS" "${VITE_BACKEND_URL}/api/settings" -o /dev/null -w "%{http_code}")

if [ $UPDATE_SETTINGS != "200" ]; then
  echo "${RED}Failed to update settings with response:${NOCOLOR}"
  echo $UPDATE_SETTINGS
  exit 1;
fi

echo "${GREENBOLD}Successfully updated settings - finished!${NOCOLOR}"

exec $cmd
