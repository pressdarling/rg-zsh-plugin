# Return immediately if rg is not found
if (( ! ${+commands[rg]} )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `rg`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_rg" ]]; then
  autoload -Uz _rg
  typeset -g -A _comps
  _comps[rg]=_rg
fi

rg --generate complete-zsh >| "$ZSH_CACHE_DIR/completions/_rg" 2>/dev/null &
