#!/usr/bin/env zsh

PROJECT_DIR=$(cd $(dirname $0); pwd)

no_cache_flag=false

local -A opthash
zparseopts -D -A opthash -- -help -version v

if [[ -n "${opthash[(i)--no-cache]}" ]]; then
  no_cache_flag='true'
fi

docker build -t ffmpeg ${PROJECT_DIR}/ffmpeg --no-cache=${no_cache_flag}
docker build -t sfdx ${PROJECT_DIR}/sfdx --no-cache=${no_cache_flag}
