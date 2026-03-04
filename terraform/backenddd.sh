#!/bin/bash

BUCKET_NAME="my-terraform-state-7t7t"
REGION="us-east-1"
TABLE_NAME="terraform-lock"

aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region $REGION

aws s3api put-bucket-versioning \
  --bucket $BUCKET_NAME \
  --versioning-configuration Status=Enabled

aws dynamodb create-table \
  --table-name $TABLE_NAME \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region $REGION

echo "Backend Ready"
