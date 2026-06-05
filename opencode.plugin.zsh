if (( ! $+commands[opencode] )); then
  return
fi

0="${${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}:${0:#/*}}"

# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function opencode_current_model() {
  command opencode stats 2>/dev/null | \
    command grep -i "model" | \
    command head -1 | \
    command sed 's/.*:\s*//'
}

function opencode_prompt_info() {
  if ! command opencode stats &>/dev/null; then
    return
  fi
  local model
  model=$(opencode_current_model)
  if [[ -n "$model" ]]; then
    echo "OC[$model]"
  fi
}

function opencode_version() {
  command opencode --version
}

# -------------------------------------------------------------------
# Aliases — core
# -------------------------------------------------------------------

alias oc='opencode'
alias occ='opencode --continue'
alias ocfork='opencode --fork --continue'
alias ocmodel='opencode --model'
alias ocagent='opencode --agent'
alias ocprompt='opencode --prompt'
alias ocpure='opencode --pure'

# -------------------------------------------------------------------
# Aliases — run mode
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
# Aliases — agent management
# -------------------------------------------------------------------

# NOTE: Shadows the --agent flag alias above
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
# Aliases — debug / db
# -------------------------------------------------------------------

alias ocdebug='opencode debug'
alias ocdb='opencode db'
alias ocdbpath='opencode db path'

# -------------------------------------------------------------------
# Aliases — utilities
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
  command opencode completion zsh | tee "$ZSH_CACHE_DIR/completions/_opencode" > /dev/null
} &|

