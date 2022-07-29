#!/bin/zsh

envsubst < ./confluent-creds.netrc > /root/.netrc

confluent login &&
confluent environment use $CONFLUENT_ENVIRONMENT_ID;
confluent kafka cluster use $CONFLUENT_CLUSTER_ID;
confluent api-key store $CONFLUENT_API_KEY $CONFLUENT_API_SECRET
confluent api-key use $CONFLUENT_API_KEY --resource $CONFLUENT_CLUSTER_ID


tail -f /dev/null # keep container alive