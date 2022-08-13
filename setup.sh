#!/usr/bin/env zsh

set -e

PROJECT_DIR=$(cd "$(dirname "${0}")"; pwd)

no_cache_flag=false

local -A opthash
zparseopts -D -A opthash -- -help -version v

if [[ -n "${opthash[(i)--no-cache]}" ]]; then
  no_cache_flag='true'
fi

if [[ -n "${opthash[(i)--no-fail]}" ]]; then
  set +e
fi

for dockerfile in "${PROJECT_DIR}"/*/Dockerfile ; do
  echo "Linting ${dockerfile}..."
  docker run --rm -i hadolint/hadolint < "${dockerfile}"
done

docker build -t ffmpeg "${PROJECT_DIR}/ffmpeg" --no-cache=${no_cache_flag}
docker build -t sfdx "${PROJECT_DIR}/sfdx" --no-cache=${no_cache_flag}
docker build -t jq "${PROJECT_DIR}/jq" --no-cache=${no_cache_flag}
