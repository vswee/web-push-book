#!/bin/bash
set -e

npm install
      
npm run build

aws s3 sync ./public/ s3://web-push-book.gauntface.com/ --delete --acl public-read

aws s3 cp \
s3://web-push-book.gauntface.com/ s3://web-push-book.gauntface.com/ \
--exclude="*" \
--include="*.html" \
--include="*.xml" \
--include="*.json" \
--include="*.svg" \
--cache-control 'max-age=86400' \
--acl public-read \
--recursive

aws s3 cp \
s3://web-push-book.gauntface.com/ s3://web-push-book.gauntface.com/ \
--exclude="*" \
--include="*.css" \
--include="*.js" \
--include="*.png" \
--include="*.jpg" \
--include="*.jpeg" \
--include="*.gif" \
--include="*.webp" \
--include="*.woff" \
--include="*.woff2" \
--include="*.mp3" \
--cache-control 'max-age=31104000' \
--acl public-read \
--recursive