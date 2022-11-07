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

for dockerfile in "${PROJECT_DIR}"/*/Dockerfile ; do
  if [ ${lint_flag} == 'true' ]; then
    echo "Linting ${dockerfile}..."
    if docker run --rm -i hadolint/hadolint hadolint --ignore DL3008 - < "${dockerfile}"; then
      printf "\e[32mok\e[m\n" # print ok
    fi
  fi

  parent_dir_name="$(basename "$(dirname "${dockerfile}")")"
  docker build -t ${parent_dir_name} "${PROJECT_DIR}/${parent_dir_name}" --no-cache=${no_cache_flag}
done
