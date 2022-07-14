#!/bin/sh

set -e

downUrl=$(curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest |
  grep browser_download_url |
  grep compiler |
  cut -d \" -f 4)

echo "downUrl: $downUrl"

KOTLIN_PACKAGE_NAME=kotlin-compiler.zip

curl -sL \
  "$downUrl" \
  -o $KOTLIN_PACKAGE_NAME

# -o 覆盖已有文件，-q 静默
unzip -oq $KOTLIN_PACKAGE_NAME -d /usr/local
rm -f $KOTLIN_PACKAGE_NAME

# 创建软链接
for f in /usr/local/kotlinc/bin/*; do
  case $f in
  *.bat) true ;;
  *) ln -sf "$f" /usr/local/bin ;;
  esac
done

kotlin -version

rm -f "$0"
