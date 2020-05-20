#!/bin/bash

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

if [[ -z "$AWS_ACCOUNT_ID" ]]; then
	echo "Set the AWS_ACCOUNT_ID env variable."
	exit 1
fi

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
	echo "Set the AWS_ACCESS_KEY_ID env variable."
	exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
	echo "Set the AWS_SECRET_ACCESS_KEY env variable."
	exit 1
fi

if [[ -z "$AWS_PROFILE" ]]; then
	echo "Set the AWS_PROFILE env variable."
	exit 1
fi

if [[ -z "$AWS_REGION" ]]; then
	echo "Set the AWS_REGION env variable."
	exit 1
fi

if [[ -z "$ENVIRONMENT" ]]; then
	echo "Set the ENVIRONMENT env variable."
	exit 1
fi

if [[ -z "$AWS_S3_TERRAFORM_BACKEND" ]]; then
	echo "Set the AWS_S3_TERRAFORM_BACKEND env variable."
	exit 1
fi

if [[ -z "$AWS_USER_DEPLOY" ]]; then
	echo "Set the AWS_USER_DEPLOY env variable."
	exit 1
fi

if [[ -z "$AWS_KMS_DESCRIPTION" ]]; then
	echo "Set the AWS_KMS_DESCRIPTION env variable."
	exit 1
fi

if [[ -z "$DOMAIN" ]]; then
	echo "Set the DOMAIN env variable."
	exit 1
fi

echo "[${AWS_PROFILE}]"                                  > /root/.aws/credentials
echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}"         >> /root/.aws/credentials
echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> /root/.aws/credentials
echo "region = ${AWS_REGION}"                           >> /root/.aws/credentials
echo "output = json"                                    >> /root/.aws/credentials

exec "$@"