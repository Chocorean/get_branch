# get_branch

This function returns the name of the branch you are currently in.

## Use case

I use it inside my `~/.bashrc` file like that:

```bash
# Add current branch name to PS1
source get_branch/get_branch.sh
PS1="\[\e[31m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]:\[\e[32m\]\w\[\e[0m\]\$(get_branch)$ "
```

As a result, my prompt shows:

```bash
XXX@ZZZ:~$ cd example
XXX@ZZZ:~/example>master$
```
