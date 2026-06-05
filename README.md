# opencode plugin

Provides completions and aliases for the [opencode](https://opencode.ai) CLI.

To use it, add `opencode` to the plugins array in your `.zshrc`:

```zsh
plugins=(... opencode)
```

## Aliases

| Alias          | Command                                      | Description                        |
|----------------|----------------------------------------------|------------------------------------|
| `oc`           | `opencode`                                   | Launch TUI                         |
| `occ`          | `opencode --continue`                        | Continue last session              |
| `ocfork`       | `opencode --fork --continue`                 | Fork last session                  |
| `ocmodel`      | `opencode --model`                           | Launch with model                  |
| `ocagent`      | `opencode --agent` / `opencode agent`        | Launch with agent / Manage agents  |
| `ocprompt`     | `opencode --prompt`                          | Launch with prompt                 |
| `ocpure`       | `opencode --pure`                            | Run without plugins                |
|                |                                              |                                    |
| `ocr`          | `opencode run`                               | Run non-interactive                |
| `ocrc`         | `opencode run --continue`                    | Continue in run mode               |
| `ocrshare`     | `opencode run --share`                       | Run and share                      |
| `ocrjson`      | `opencode run --format json`                 | Run with JSON output               |
| `ocrfile`      | `opencode run --file`                        | Run with file attachment           |
| `ocrattach`    | `opencode run --attach`                      | Run attached to server             |
| `ocrq`         | `opencode run --dangerously-skip-permissions`| Quick run                          |
|                |                                              |                                    |
| `ocserve`      | `opencode serve`                             | Start headless server              |
| `ocweb`        | `opencode web`                               | Start server + web UI              |
| `ocattach`     | `opencode attach`                            | Attach TUI to server               |
| `ocacp`        | `opencode acp`                               | Start ACP server                   |
|                |                                              |                                    |
| `ocauth`       | `opencode auth`                              | Manage auth                        |
| `ocauthlogin`  | `opencode auth login`                        | Login to provider                  |
| `ocauthls`     | `opencode auth list`                         | List auth providers                |
| `ocauthlogout` | `opencode auth logout`                       | Logout from provider               |
|                |                                              |                                    |
| `ocmodels`     | `opencode models`                            | List models                        |
| `ocmodelsr`    | `opencode models --refresh`                  | Refresh models cache               |
| `ocmodelsv`    | `opencode models --verbose`                  | List models with details           |
|                |                                              |                                    |
| `ocmcp`        | `opencode mcp`                               | Manage MCP servers                 |
| `ocmcpadd`     | `opencode mcp add`                           | Add MCP server                     |
| `ocmcpls`      | `opencode mcp list`                          | List MCP servers                   |
| `ocmcpauth`    | `opencode mcp auth`                          | Authenticate MCP                   |
| `ocmcplogout`  | `opencode mcp logout`                        | Logout MCP                         |
| `ocmcpdebug`   | `opencode mcp debug`                         | Debug MCP connection               |
|                |                                              |                                    |
| `ocagentls`    | `opencode agent list`                        | List agents                        |
| `ocagentcreate`| `opencode agent create`                      | Create new agent                   |
|                |                                              |                                    |
| `ocsession`    | `opencode session`                           | Manage sessions                    |
| `ocsessionls`  | `opencode session list`                      | List sessions                      |
| `ocsessiondel` | `opencode session delete`                    | Delete session                     |
|                |                                              |                                    |
| `ocstats`      | `opencode stats`                             | Show usage stats                   |
| `ocstatsmodels`| `opencode stats --models`                    | Show model breakdown               |
|                |                                              |                                    |
| `ocexport`     | `opencode export`                            | Export session                     |
| `ocimport`     | `opencode import`                            | Import session                     |
|                |                                              |                                    |
| `ocgh`         | `opencode github`                            | GitHub agent                       |
| `ocghinstall`  | `opencode github install`                    | Install GitHub agent               |
| `ocghrun`      | `opencode github run`                        | Run GitHub agent                   |
| `ocpr`         | `opencode pr`                                | Fetch PR and run                   |
|                |                                              |                                    |
| `ocplugin`     | `opencode plugin`                            | Install plugin                     |
| `ocplug`       | `opencode plug`                              | Plugin alias                       |
| `ocpluging`    | `opencode plugin --global`                   | Install plugin globally            |
|                |                                              |                                    |
| `ocdebug`      | `opencode debug`                             | Debug tools                        |
| `ocdb`         | `opencode db`                                | Database tools                     |
| `ocdbpath`     | `opencode db path`                           | Print DB path                      |
|                |                                              |                                    |
| `ocupgrade`    | `opencode upgrade`                           | Upgrade opencode                   |
| `ocuninstall`  | `opencode uninstall`                         | Uninstall opencode                 |
| `occompletion` | `opencode completion`                        | Generate completions               |

## Functions

| Function                  | Description                        |
|---------------------------|------------------------------------|
| `opencode_version`        | Print opencode version             |
| `opencode_current_model`  | Print the active model name        |
| `opencode_prompt_info`    | Show opencode info for use in RPS1 |

## Completion

Completions are generated asynchronously on shell startup by running
`opencode completion zsh`. The output is cached in
`$ZSH_CACHE_DIR/completions/_opencode`.

If completions are not working, regenerate them manually:

```zsh
opencode completion zsh > "$ZSH_CACHE_DIR/completions/_opencode"
```

### Main branch preference

The completion file ships with the plugin as a convenience. When you
run `opencode completion zsh`, the dynamically generated version takes
precedence over the shipped stub. This keeps completions in sync with
the installed version of opencode.

