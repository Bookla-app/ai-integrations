# Cursor

Bookla's [Cursor Marketplace](https://cursor.com/marketplace) plugin. It lives in [`bookla/`](bookla/) and is registered by the root [`.cursor-plugin/marketplace.json`](../.cursor-plugin/marketplace.json) through `metadata.pluginRoot: "cursor"`.

## Validate

```bash
node scripts/validate-cursor.mjs   # run from the repo root
```

## Test locally

Copy the plugin into Cursor's local plugin folder, then restart Cursor or run **Developer: Reload Window**:

```bash
mkdir -p ~/.cursor/plugins/local
cp -R cursor/bookla ~/.cursor/plugins/local/bookla
```

Open **Customize** and check that the `bookla-merchant` skill and the `bookla` MCP server are listed. Then connect the server: your browser opens the Bookla sign-in. If the Marketplace copy is also installed, Cursor loads both, so remove one while you test.

## Publish

1. The repository must be public.
2. Submit the repository URL at <https://cursor.com/marketplace/publish>.
3. For updates, bump `version` in `bookla/.cursor-plugin/plugin.json`, push, and ask Cursor to re-index. You don't need to apply again.

Publisher terms: <https://cursor.com/marketplace-publisher-terms>. In short, the plugin must be free, permissively licensed and accurately described, and must not use plugin data to train models.

## OAuth client

We don't offer dynamic client registration, so Cursor sends the fixed public client ID `bookla-cursor` (set in `bookla/mcp.json`). The Bookla authorization server has it registered as a public client (PKCE, no secret) with Cursor's fixed callbacks:

- `http://localhost:8787/callback`: the desktop app
- `https://www.cursor.com/agents/mcp/oauth/callback`: web and Cursor Agents
