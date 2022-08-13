#!/usr/bin/env bash

set -e

PROJECT_DIR=$(cd "$(dirname "${0}")"; pwd)

lint_flag=false
no_cache_flag=false

# Parse options
while [[ ${#} -gt 0 ]]; do
  case "${1}" in
  --lint)
    lint_flag='true'
    shift
    ;;
  --no-cache)
    no_cache_flag='true'
    shift
    ;;
  --no-fail)
    set +e
    shift
    ;;
  -*)
    echo "Given invalid option: ${1}"
    exit 1
    ;;
  *)
    shift
    ;;
  esac
done

if [ ${lint_flag} == 'true' ]; then
  for dockerfile in "${PROJECT_DIR}"/*/Dockerfile ; do
    echo "Linting ${dockerfile}..."
    docker run --rm -i hadolint/hadolint hadolint --ignore DL3008 - < "${dockerfile}"
  done
fi

docker build -t ffmpeg "${PROJECT_DIR}/ffmpeg" --no-cache=${no_cache_flag}
docker build -t sfdx "${PROJECT_DIR}/sfdx" --no-cache=${no_cache_flag}
docker build -t jq "${PROJECT_DIR}/jq" --no-cache=${no_cache_flag}
