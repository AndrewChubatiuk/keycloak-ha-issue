#!/bin/bash

set -e
PREFIX=WAIT_FOR_

CHECKS=$(compgen -A variable | grep $PREFIX)
for check in $CHECKS; do
   SERVICE=${check#"$PREFIX"}
   RETRIES=${RETRIES_COUNT:-10}
   echo "Waiting for $SERVICE to start..."
   until ${!check}; do
      if [ $RETRIES > 0 ]; then
         let "RETRIES-=1"
         echo "$SERVICE is not ready. ${RETRIES} attempts left. Retry in 5 seconds..."
         sleep 6
      else
         echo "Failed to start ${SERVICE}"
         exit 1
      fi
   done
   echo "$SERVICE is up and ready"
done

exec "$@"
