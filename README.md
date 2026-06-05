# opencode plugin

Aliases and completions for the [opencode](https://opencode.ai) CLI — the
open-source AI coding agent for the terminal.

## Enable

Add `opencode` to your plugins array in `.zshrc`:

```zsh
plugins=(... opencode)
```

## Quick start

| If you want to...                | Type this          |
| -------------------------------- | ------------------ |
| Launch opencode in this project  | `oc`               |
| Pick up where you left off       | `occ`              |
| Ask a quick question, no TUI     | `ocr "question"`   |
| Attach to a remote server        | `ocattach <url>`   |
| Check your usage and costs       | `ocstats`          |
| Upgrade to the latest version    | `ocupgrade`        |

## Aliases

All aliases use the `oc` prefix. The first letter after `oc` identifies the
command group: `r` for run, `s` for serve, `m` for models, and so on.

| Alias           | Command                                        | Description                      |
| --------------- | ---------------------------------------------- | -------------------------------- |
| `oc`            | `opencode`                                     | Launch TUI                       |
| `occ`           | `opencode --continue`                          | Continue last session            |
| `ocfork`        | `opencode --fork --continue`                   | Fork last session                |
| `ocmodel`       | `opencode --model`                             | Launch with a specific model     |
| `ocprompt`      | `opencode --prompt`                            | Launch with an initial prompt    |
| `ocpure`        | `opencode --pure`                              | Launch without plugins           |
| `ocr`           | `opencode run`                                 | Run non-interactive              |
| `ocrc`          | `opencode run --continue`                      | Continue in run mode             |
| `ocrshare`      | `opencode run --share`                         | Run and share the session        |
| `ocrjson`       | `opencode run --format json`                   | Run with JSON output             |
| `ocrfile`       | `opencode run --file`                          | Run with files attached          |
| `ocrattach`     | `opencode run --attach`                        | Run attached to a server         |
| `ocrq`          | `opencode run --dangerously-skip-permissions`  | Quick run (skip permission asks) |
| `ocserve`       | `opencode serve`                               | Start headless server            |
| `ocweb`         | `opencode web`                                 | Start server with web UI         |
| `ocattach`      | `opencode attach`                              | Attach TUI to running server     |
| `ocacp`         | `opencode acp`                                 | Start ACP server                 |
| `ocauth`        | `opencode auth`                                | Manage credentials               |
| `ocauthlogin`   | `opencode auth login`                          | Log in to a provider             |
| `ocauthls`      | `opencode auth list`                           | List authenticated providers     |
| `ocauthlogout`  | `opencode auth logout`                         | Log out of a provider            |
| `ocmodels`      | `opencode models`                              | List available models            |
| `ocmodelsr`     | `opencode models --refresh`                    | Refresh models cache             |
| `ocmodelsv`     | `opencode models --verbose`                    | List models with metadata        |
| `ocmcp`         | `opencode mcp`                                 | Manage MCP servers               |
| `ocmcpadd`      | `opencode mcp add`                             | Add an MCP server                |
| `ocmcpls`       | `opencode mcp list`                            | List MCP servers                 |
| `ocmcpauth`     | `opencode mcp auth`                            | Authenticate with an MCP server  |
| `ocmcplogout`   | `opencode mcp logout`                          | Remove MCP credentials           |
| `ocmcpdebug`    | `opencode mcp debug`                           | Debug MCP connection issues      |
| `ocagent`       | `opencode agent`                               | Manage agents                    |
| `ocagentls`     | `opencode agent list`                          | List agents                      |
| `ocagentcreate` | `opencode agent create`                        | Create a new agent               |
| `ocsession`     | `opencode session`                             | Manage sessions                  |
| `ocsessionls`   | `opencode session list`                        | List sessions                    |
| `ocsessiondel`  | `opencode session delete`                      | Delete a session                 |
| `ocstats`       | `opencode stats`                               | Show usage statistics            |
| `ocstatsmodels` | `opencode stats --models`                      | Show per-model usage breakdown   |
| `ocexport`      | `opencode export`                              | Export session data as JSON      |
| `ocimport`      | `opencode import`                              | Import session from JSON/URL     |
| `ocgh`          | `opencode github`                              | Manage GitHub agent              |
| `ocghinstall`   | `opencode github install`                      | Install GitHub agent             |
| `ocghrun`       | `opencode github run`                          | Run GitHub agent                 |
| `ocpr`          | `opencode pr`                                  | Fetch PR and run opencode on it  |
| `ocplugin`      | `opencode plugin`                              | Install a plugin                 |
| `ocplug`        | `opencode plug`                                | Shorthand for `plugin`           |
| `ocpluging`     | `opencode plugin --global`                     | Install plugin globally          |
| `ocdebug`       | `opencode debug`                               | Debugging and troubleshooting    |
| `ocdb`          | `opencode db`                                  | Database utilities               |
| `ocdbpath`      | `opencode db path`                             | Print database file path         |
| `ocupgrade`     | `opencode upgrade`                             | Upgrade opencode                 |
| `ocuninstall`   | `opencode uninstall`                           | Uninstall opencode               |
| `occompletion`  | `opencode completion`                          | Print shell completion script    |

## Examples

```zsh
# Start or continue a session in the current project
oc

# Continue where you left off
occ

# Ask a one-shot question without entering the TUI
ocr "What does this function do?"

# List available models from all configured providers
ocmodels

# Run with JSON output, useful for scripting
ocrjson "Check for security issues" > audit.json

# Start a headless server that other terminals can attach to
ocserve --port 4096

# Attach a TUI to that server from another terminal
ocattach http://localhost:4096

# Show token usage and cost
ocstats

# Install a plugin
ocplugin opencode-model-scout
```

## Completion

On the first shell startup after enabling this plugin, `opencode completion zsh`
runs in the background and caches the output to
`$ZSH_CACHE_DIR/completions/_opencode`. After that, tab-completion works for
all opencode commands and flags.

If completions are missing or outdated, regenerate them manually:

```zsh
opencode completion zsh > "$ZSH_CACHE_DIR/completions/_opencode"
```

The plugin ships with a static completion file as a fallback. The dynamically
generated version takes precedence once cached.
