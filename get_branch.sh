#!/bin/bash

function get_branch {
  path=$(pwd)
  while [[ "$path" != "/" ]]; do
    if [[ -d .git ]]; then
      # branch=$(git branch 2> /dev/null | awk '{print $2}')
      branch="$(git branch 2> /dev/null)"
      if [[ "$branch" =~ .*detached.* ]]  # detached HEAD
      then
        branch=" $(git log | head -n1 | cut -d\  -f2 | cut -c 1-7)"
      elif [[ "$branch" =~ .*rebasing.* ]]  # during rebase
      then
        branch="$(echo "$branch" | head -n1 | sed -e 's/.*rebasing \(.*\))$/[rebase]\1/')"
      else  # normal case
        branch="$(git branch | \grep '*' | awk '{print $2}')"
      fi
      echo " $branch"
      return 0
    fi
    cd ..
    path=$(pwd)
  done
  return 1
}
