#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL https://github.com/cc332030$1 | sh -s -- $parameter"
}

browserDownloadUrl=$(curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest \
            | grep browser_download_url \
            | grep compiler)

# 截取 `: "` 右边的字符串
browserDownloadUrl=${browserDownloadUrl#*: \"}

# 截取 `"` 左边的字符串
browserDownloadUrl=${browserDownloadUrl%\"*}

echo "browserDownloadUrl: $browserDownloadUrl"

curl -sL \
    "$browserDownloadUrl" \
    -o kotlin-compiler.zip

# -o 覆盖已有文件，-q 静默
unzip -oq kotlin-compiler.zip -d /usr/local

# shellcheck disable=SC2010
ls /usr/local/kotlinc/bin/* \
  | grep -v "bat" \
  | xargs -I {} ln -sf {} /usr/local/bin

kotlin -version
