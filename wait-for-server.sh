#!/bin/sh

# Exit script on error
set -e

cmd="$@"

# Install jq for later JSON use
apk update
apk add jq curl

REQ=""
# 404 means the server is responding, started and ready to reviece endpoints
until [ REQ != "404" ]; do
  REQ=$(curl -s -X GET "${VITE_SERVER_URL}" -w "%{http_code}")
  echo $REQ
  echo "Backend not yet started - waiting.."
  sleep 5
done

echo "Backend started - initializing.."

# --------------------
# Create admin account (if not exists)
# --------------------
ADMIN_CREATE=$(curl -s -X POST -H "Content-Type: application/json" -d '{ "email": "'"${SERVER_ADMIN_EMAIL}"'", "password": "'"${SERVER_ADMIN_PASSWORD}"'", "passwordConfirm": "'"${SERVER_ADMIN_PASSWORD}"'" }' "${VITE_SERVER_URL}/api/admins" -w "%{http_code}")

# Admin account already exists
if [ $ADMIN_CREATE = '401' ]; then
  echo "(1/4) Admin account already exists - logging in..";
# Error occu
elif [ $ADMIN_CREATE != '200' ]; then
  echo "Creating admin account failed with response:"
  echo $ADMIN_CREATE
  exit 1;
else
  echo "(1/4) Successfully created admin account - logging in.."
fi

# --------------------
# Login with admin account
# --------------------
ADMIN_LOGIN=$(curl -s -X POST -H "Content-Type: application/json" -d '{ "identity": "'"${SERVER_ADMIN_EMAIL}"'", "password": "'"${SERVER_ADMIN_PASSWORD}"'" }' "${VITE_SERVER_URL}/api/admins/auth-with-password")
ADMIN_TOKEN=$(echo $ADMIN_LOGIN | jq -r '.token')

if [ $ADMIN_TOKEN = '' ]; then
  echo "Failed admin account authentication with response:"
  echo $ADMIN_LOGIN
  exit 1;
fi

echo "(2/4) Successfully logged in with admin account - updating structure.."

# --------------------
# Update DB structure
# --------------------
JSON_DATA=$(jq -c . db_schema.json)
UPDATE_STRUCTURE=$(curl -s -X PUT -H "Content-Type: application/json" -H "Authorization: ${ADMIN_TOKEN}" -d '{"collections": '"$JSON_DATA"' }' "${VITE_SERVER_URL}/api/collections/import")

# On success respond is null (so checking for not null response)
if [ $UPDATE_STRUCTURE ]; then
  echo "Failed to update database structure with response:"
  echo $UPDATE_STRUCTURE
  exit 1;
fi

echo "(3/4) Successfully updated database structure - updating settings.."

# --------------------
# Update settings and OAuth providers
# --------------------
SETTINGS='{
  "meta": {
      "appName": "AquaHub",
      "appUrl": "'"${VITE_SERVER_URL}"'"
  },
  "googleAuth": {
    "enabled": true,
    "clientId": "'"${GOOGLE_CLIENT_ID}"'",
    "clientSecret": "'"${GOOGLE_CLIENT_SECRET}"'"
  },
  "githubAuth": {
    "enabled": true,
    "clientId": "'"${GITHUB_CLIENT_ID}"'",
    "clientSecret": "'"${GITHUB_CLIENT_SECRET}"'"
  }
}'

UPDATE_SETTINGS=$(curl -s -X PATCH -H "Content-Type: application/json" -H "Authorization: ${ADMIN_TOKEN}" -d "$SETTINGS" "${VITE_SERVER_URL}/api/settings" -o /dev/null -w "%{http_code}")

if [ $UPDATE_SETTINGS != '200' ]; then
  echo "Failed to update settings with response:"
  echo $UPDATE_SETTINGS
  exit 1;
fi

echo "(4/4) Successfully updated settings - finished!"

exec $cmd
