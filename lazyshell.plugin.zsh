#!/usr/bin/env zsh

0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
[[ -z ${fpath[(r)${0:h}/functions]} ]] && fpath+=( "${0:h}/functions" )
autoload -Uz .lazyshell_complete .lazyshell_explain .lzsh_llm_api_call

.lzsh_get_distribution_name() { # $1: parameter name
  case $OSTYPE in
    *darwin*) : ${(P)1::="$(sw_vers -productName) $(sw_vers -productVersion)"} 2>/dev/null ;;
    *linux*) : ${(P)1::=$(sed -n '/PRETTY_NAME/{ s/^.*="*//; s/"$//; p }' /etc/*-release)};;
    # otherwise, leave parameter unchanged
  esac
}

.lzsh_preflight_check() {
  emulate -L zsh
  if [ -z "$OPENAI_API_KEY" ]; then
    echo ""
    echo "Error: OPENAI_API_KEY is not set"
    echo "Get your API key from https://platform.openai.com/account/api-keys and then run:"
    echo "OPENAI_API_KEY=<your API key>"
    zle -I
    return 1
  fi

  if ! (($+commands[jq])); then
    echo ""
    echo "Error: jq is not installed"
    zle -I
    return 1
  fi

  if ! (($+commands[curl] || $+commands[wget])); then
    echo ""
    echo "Error: curl or wget is not installed"
    zle -I
    return 1
  fi
}

if [ -z "$OPENAI_API_KEY" ]; then
  echo "Warning: OPENAI_API_KEY is not set"
  echo "Get your API key from https://platform.openai.com/account/api-keys and then run:"
  echo "OPENAI_API_KEY=<your API key>"
fi

# Bind the lazyshell.complete widget to the Alt-g hotkey
# Bind the lazyshell.explain widget to the Alt-e hotkey
zle -N lazyshell.complete .lazyshell_complete
zle -N lazyshell.explain .lazyshell_complain
bindkey '\eg' lazyshell.complete
bindkey '\ee' lazyshell.explain

typeset -ga ZSH_AUTOSUGGEST_CLEAR_WIDGETS
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=( lazyshell.explain )
