#!/bin/bash
set -ex

url=$(curl -sI "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" | grep Location | awk '{print $2}')
url=${url%$'\r'}
filename=$(basename $url)
dir=${filename%$'.tar.bz2'}
curl -so $filename $url
mkdir $dir
tar -jxf $filename -C $dir --strip-components=1
ln -sf $dir/firefox firefox
