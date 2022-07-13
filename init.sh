#!/bin/sh

set -e

downUrl=$(curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest |
  grep browser_download_url |
  grep compiler |
  cut -d \" -f 4)

echo "downUrl: $downUrl"

curl -sL \
  "$downUrl" \
  -o kotlin-compiler.zip

# -o 覆盖已有文件，-q 静默
unzip -oq kotlin-compiler.zip -d /usr/local
rm -f kotlin-compiler.zip

# 创建软链接
for f in /usr/local/kotlinc/bin/*; do
  case $f in
  *.bat) true ;;
  *) ln -sf "$f" /usr/local/bin ;;
  esac
done

kotlin -version

rm -f "$0"
