# Bookla AI integrations

Packages that list [Bookla](https://bookla.com) in AI marketplaces and IDE plugin directories. Each provider has its own directory.

All of them connect to the same hosted **Bookla merchant MCP server**:

- Endpoint: `https://mcp.bookla.com/mcp` (Streamable HTTP)
- Auth: OAuth 2.1 with PKCE. The merchant signs in with their Bookla account and picks the companies to share and read-only or read-write access. No API key is stored in the client. EU and US accounts are both supported: the sign-in page asks for the region.

## Providers

| Directory | Marketplace | Status |
|-----------|-------------|--------|
| [`cursor/`](cursor/) | [Cursor Marketplace](https://cursor.com/marketplace) | In preparation |
| [`antigravity/`](antigravity/) | [Antigravity Marketplace](https://antigravity.google/docs/marketplace) | In preparation |

## Repository layout

```text
.
├── .cursor-plugin/
│   └── marketplace.json     # Cursor requires this at the repo root; it points into cursor/
├── cursor/
│   └── bookla/              # Cursor plugin (manifest, mcp.json, skill, logo)
├── antigravity/
│   └── bookla/              # Antigravity plugin (plugin.json, mcp_config.json, skill, logo)
├── scripts/
│   └── validate-cursor.mjs  # Cursor manifest validator (from cursor/plugin-template)
└── LICENSE                  # MIT (Cursor requires a permissive license)
```

Some marketplaces read a manifest from a fixed path at the repo root, as Cursor does with `.cursor-plugin/`. Keep those root files as thin pointers into the provider's directory.

## Shared skill

`skills/bookla-merchant/SKILL.md` is copied into each provider's plugin, because each marketplace packages only its own plugin directory. Edit all copies together. `scripts/check-shared.sh` fails if they differ.

## Adding a provider

1. Create `<provider>/` with that marketplace's package format.
2. Point the MCP config at `https://mcp.bookla.com/mcp`.
3. Check how the client gets an OAuth client ID:
   - **CIMD**, e.g. Antigravity: add its metadata host to `MCP_OAUTH_CIMD_ALLOWED_HOSTS` in the platform config.
   - **Fixed client ID**, e.g. Cursor: add a public static client in the platform config (`MCP_OAUTH_*_CLIENT_ID`).
   - **DCR only**: not supported by the Bookla authorization server.
4. Add a row to the table above.

## Support

support@bookla.com · [docs.bookla.com](https://docs.bookla.com/)
