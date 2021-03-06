# ------------------------------------------------------------------------------
# General aliases and functions
# ------------------------------------------------------------------------------

alias c="clear"
alias o="open ."
alias rm="trash"
alias rf="trash -rf"
alias sizes='du -sh -c *'

# Copy pwd to clipboard
alias cwd="pwd && pwd | pbcopy && echo 'Copied to clipboard 📁'"

# Run any command from anywhere, without leaving current working directory.
#
# Usage: `in [target] [command]`
# Target: `shtuff` target (if available), else `z` argument
# Example: `in sand art make:model -a SomeModel`

function in() {(
  if [[ $(shtuff has $1 2>&1) =~ 'was found' ]]; then
    eval shtuff into $1 \"${@:2}\"
  else
    z $1
    eval ${@:2}
  fi
)}
