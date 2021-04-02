#!/bin/bash

function get_branch {
  path=$(pwd)
  while [[ "$path" != "/" ]]; do
    if [[ -d .git ]]; then
      branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
      echo ">$branch"
      return 0
    fi
    cd ..
    path=$(pwd)
  done
  return 1
}

