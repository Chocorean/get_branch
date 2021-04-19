#!/bin/bash

function get_branch {
  path=$(pwd)
  while [[ "$path" != "/" ]]; do
    if [[ -d .git ]]; then
      branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	  if [[ "$branch" == "HEAD" ]]
	  then
        branch="DH@$(git log | head -n1 | cut -d\  -f2 | cut -c 1-7)"
	  fi
      echo ">$branch"
      exit 0
    fi
    cd ..
    path=$(pwd)
  done
  exit 1
}

