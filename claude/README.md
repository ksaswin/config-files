# Claude

Customisations built for `claude` CLI harness.

## Statusline

Add the statusline script to `~/.claude/statusline-command.sh` and update the config file to use it.

In `settings.json`, add the following:
```json
  "statusLine": {
    "type": "command",
    "command": "sh ~/.claude/statusline-command.sh"
  }
```

