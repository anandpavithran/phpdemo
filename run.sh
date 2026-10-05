#!/usr/bin/env bash
#
## Set exact staging route retrieved from 'oc get routes'
URL="https://financial-gateway-3scale-apicast-staging.apps.lab.example.com:443/lab1/api/v1/accounts"
USER_KEY=223657ec2cd15f4f734bf829a713fe3a
#
for i in {1..5}; do
  RESPONSE=$(curl -k -s -w "\n%{http_code}" "${URL}?user_key=${USER_KEY}")
  HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
  echo "Request $i: HTTP ${HTTP_CODE}"
  sleep 0.2
done
