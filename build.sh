#!/bin/bash
#

set -e

CONTAINERVERSION=`cat VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}'`
echo $CONTAINERVERSION > VERSION

docker build -t robinhoodis/nginx-injection:${CONTAINERVERSION} .
docker push robinhoodis/nginx-injection:${CONTAINERVERSION}
