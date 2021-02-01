#!/bin/bash

function get_branch {
  path=$(pwd)
  while [[ "$path" != "/" ]]; do
    if [[ -d .git ]]; then
      branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
      echo ">$branch"
      exit 0
    fi
    cd ..
    path=$(pwd)
  done
  exit 1
}

