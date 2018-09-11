#!/bin/sh
aws configure set aws_access_key_id ${PLUGIN_ACCESS_ID}
aws configure set aws_secret_access_key ${PLUGIN_SECRET_KEY}
aws configure set region ${PLUGIN_REGION}
$(aws ecr get-login --no-include-email --region ${PLUGIN_REGION})
sleep 1
docker pull ${PLUGIN_ECR_IMAGE}
