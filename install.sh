#! /bin/sh
# exit if a command fails
set -e

apk update

# install pg_dump
apk add postgresql

# install numfmt from coreutils for converting bytes number to human friendly
apk add coreutils

# install s3 tools
apk add aws-cli
#pip3 install --upgrade pip
#pip3 install awscli
#apk del py3-pip

# install go-cron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl

# cleanup
rm -rf /var/cache/apk/*
