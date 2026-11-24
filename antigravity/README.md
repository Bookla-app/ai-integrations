# Antigravity

Bookla's [Antigravity Marketplace](https://antigravity.google/docs/marketplace) plugin lives in [`bookla/`](bookla/). It's a standalone Antigravity plugin: `plugin.json` sits at the plugin root, and MCP servers are defined in `mcp_config.json`.

## Validate and test locally

Install the Antigravity CLI (`agy`), then run these from the repo root:

```bash
agy plugin validate --strict ./antigravity/bookla
agy plugin install ./antigravity/bookla
agy plugin list
```

In the Antigravity App, open **Customizations → Installed**, authenticate the Bookla MCP server, and try a suggested prompt.

## Publish

Submit the validated plugin through the [Antigravity Marketplace partner intake form](https://forms.gle/2EX5RFYPoJe1UgxR9). Give the repository URL and the plugin path `antigravity/bookla`. For updates, bump `version` in `bookla/plugin.json`.

Marketplace requirements: `plugin.json` must include `name`, `displayName`, `description`, `version`, `logo`, `suggestedPrompts` and `author`, and the plugin needs a `README.md` and a bundled logo. The logo must be a 1:1 square of at least 128 px, with about 10% transparent padding, and legible on light and dark themes.

## OAuth

There's no client to register. Antigravity uses Client ID Metadata Documents (CIMD):

- `client_id`: `https://antigravity.google/oauth/client-metadata.json`
- redirect: `https://antigravity.google/oauth-callback`. That page shows a code, which the user pastes back into Antigravity.

The Bookla authorization server allows `antigravity.google` as a metadata host in every region.
