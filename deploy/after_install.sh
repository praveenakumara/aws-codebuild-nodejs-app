#!/bin/bash

cd /home/ubuntu/simple-nodejs-app


pip3 install -r requirements.txt
# pip3 install awscli

# npm i -g pm2


aws secretsmanager get-secret-value --secret-id clip-podcast-stream --region us-east-1 --query SecretString --output text | jq -r 'keys[] as $k
| "\($k)=\(.[$k])"' >> /tmp/.env
eval $(cat /tmp/.env | sed 's/ *= */=/' | sed 's/^/export /')
rm /tmp/.env

aws s3 cp s3://$S3_BUCKET_NAME/$ALL_MPNET_OBJECT_KEY . 
unzip -o $ALL_MPNET_OBJECT_KEY 
rm $ALL_MPNET_OBJECT_KEY

aws s3 cp s3://$S3_BUCKET_NAME/$BERT_OBJECT_KEY . 
unzip -o $BERT_OBJECT_KEY 
rm $BERT_OBJECT_KEY