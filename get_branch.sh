#!/bin/bash

function get_branch {
  path=$(pwd)
  while [[ "$path" != "/" ]]; do
    if [[ -d .git ]]; then
      branch=$(git branch 2> /dev/null | awk '{print $2}')
	  if [[ "$branch" =~ .*detached.* ]]
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

