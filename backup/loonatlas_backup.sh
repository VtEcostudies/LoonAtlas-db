#!/bin/bash -x

#create backup filename and filepath
#pg_dump -Fc is compressed by default. However, it is not a .zip or .gzip, so don't call it that.
fileback=loonatlas_v2_latest.backup
filename=loonatlas_v2_$(date -d "today" +"%Y%m%d-%H%M").backup
filepath=/home/ubuntu/loonatlas-postgres-db/backup/
echo $filepath$filename

#create backup locally
#pg_dump -Fc is compressed by default. However, it is not a .zip or .gzip, so don't call it that.
sudo -u postgres pg_dump loonatlas -Fc > $filepath$fileback

#copy backup to aws s3
sudo aws s3 rm s3://loonatlas.backup/$fileback
sudo aws s3 mv $filepath$fileback s3://loonatlas.backup/$fileback
sudo aws s3 cp s3://loonatlas.backup/$fileback s3://loonatlas.backup/$filename
