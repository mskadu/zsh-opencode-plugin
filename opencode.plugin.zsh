if (( ! $+commands[opencode] )); then
  return
fi

0="${${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}:${0:#/*}}"

# -------------------------------------------------------------------
# Aliases — core TUI
# -------------------------------------------------------------------

alias oc='opencode'
alias occ='opencode --continue'
alias ocfork='opencode --fork --continue'
alias ocmodel='opencode --model'
alias ocprompt='opencode --prompt'
alias ocpure='opencode --pure'

# -------------------------------------------------------------------
# Aliases — run (non-interactive)
# -------------------------------------------------------------------

alias ocr='opencode run'
alias ocrc='opencode run --continue'
alias ocrshare='opencode run --share'
alias ocrjson='opencode run --format json'
alias ocrfile='opencode run --file'
alias ocrattach='opencode run --attach'
alias ocrq='opencode run --dangerously-skip-permissions'

# -------------------------------------------------------------------
# Aliases — server
# -------------------------------------------------------------------

alias ocserve='opencode serve'
alias ocweb='opencode web'
alias ocattach='opencode attach'
alias ocacp='opencode acp'

# -------------------------------------------------------------------
# Aliases — auth
# -------------------------------------------------------------------

alias ocauth='opencode auth'
alias ocauthlogin='opencode auth login'
alias ocauthls='opencode auth list'
alias ocauthlogout='opencode auth logout'

# -------------------------------------------------------------------
# Aliases — models
# -------------------------------------------------------------------

alias ocmodels='opencode models'
alias ocmodelsr='opencode models --refresh'
alias ocmodelsv='opencode models --verbose'

# -------------------------------------------------------------------
# Aliases — MCP
# -------------------------------------------------------------------

alias ocmcp='opencode mcp'
alias ocmcpadd='opencode mcp add'
alias ocmcpls='opencode mcp list'
alias ocmcpauth='opencode mcp auth'
alias ocmcplogout='opencode mcp logout'
alias ocmcpdebug='opencode mcp debug'

# -------------------------------------------------------------------
# Aliases — agents
# -------------------------------------------------------------------

alias ocagent='opencode agent'
alias ocagentls='opencode agent list'
alias ocagentcreate='opencode agent create'

# -------------------------------------------------------------------
# Aliases — sessions
# -------------------------------------------------------------------

alias ocsession='opencode session'
alias ocsessionls='opencode session list'
alias ocsessiondel='opencode session delete'

# -------------------------------------------------------------------
# Aliases — stats
# -------------------------------------------------------------------

alias ocstats='opencode stats'
alias ocstatsmodels='opencode stats --models'

# -------------------------------------------------------------------
# Aliases — export / import
# -------------------------------------------------------------------

alias ocexport='opencode export'
alias ocimport='opencode import'

# -------------------------------------------------------------------
# Aliases — GitHub
# -------------------------------------------------------------------

alias ocgh='opencode github'
alias ocghinstall='opencode github install'
alias ocghrun='opencode github run'
alias ocpr='opencode pr'

# -------------------------------------------------------------------
# Aliases — plugins
# -------------------------------------------------------------------

alias ocplugin='opencode plugin'
alias ocplug='opencode plug'
alias ocpluging='opencode plugin --global'

# -------------------------------------------------------------------
# Aliases — debug / database
# -------------------------------------------------------------------

alias ocdebug='opencode debug'
alias ocdb='opencode db'
alias ocdbpath='opencode db path'

# -------------------------------------------------------------------
# Aliases — maintenance
# -------------------------------------------------------------------

alias ocupgrade='opencode upgrade'
alias ocuninstall='opencode uninstall'
alias occompletion='opencode completion'

# -------------------------------------------------------------------
# Completion wiring
# -------------------------------------------------------------------

if [[ ! -f "$ZSH_CACHE_DIR/completions/_opencode" ]]; then
  typeset -g -A _comps
  autoload -Uz _opencode
  _comps[opencode]=_opencode
fi

{
  mkdir -p "$ZSH_CACHE_DIR/completions"
  command opencode completion zsh \
    | tee "$ZSH_CACHE_DIR/completions/_opencode" \
    > /dev/null
} &|
