Shell Variables and Environment Variables – Summary

A local shell variable exists only in the current shell:
MY_ROLE="DevOps Engineer"

An exported environment variable is also available to child processes:
export MY_ROLE="DevOps Engineer"

$PATH contains a list of directories where Linux searches for executable commands. Directories are separated by ":".
Example:
export PATH="$PATH:$HOME/custom_bin"

~/.bashrc is mainly used for Bash aliases, shell settings, and interactive shell configuration.
~/.profile is mainly used for login environment variables and settings.

Examples from the lab:
MY_ROLE="DevOps Engineer"
export PATH="$PATH:$HOME/custom_bin"
alias gstatus='git status'

Useful commands:
printenv / env → display environment variables
echo $VAR → display the value of a variable
export → make a variable available to child processes
alias → create a shortcut for a command
source → reload a configuration file in the current shell

Example:
source ~/.bashrc