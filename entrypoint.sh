#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL https://github.com/cc332030$1 | sh -s -- $parameter"
}
