#!/bin/sh
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = ${PLUGIN_ACCESS_ID}" >> ~/.aws/credentials
echo "aws_secret_access_key = ${PLUGIN_SECRET_KEY}" >> ~/.aws/credentials
sleep 1
aws ecr get-login --region ${PLUGIN_REGION} | bash
docker pull ${PLUGIN_ECR_IMAGE}
