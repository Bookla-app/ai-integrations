# Bookla AI integrations

Packages that list [Bookla](https://bookla.com) in AI marketplaces and IDE plugin directories. Each provider has its own directory.

All of them connect to the same hosted **Bookla merchant MCP server**:

- Endpoint: `https://mcp.bookla.com/mcp` (Streamable HTTP)
- Auth: OAuth 2.1 with PKCE. The merchant signs in with their Bookla account and picks the companies to share and read-only or read-write access. No API key is stored in the client. EU and US accounts are both supported: the sign-in page asks for the region.

## Bookla MCP server

This repository holds the marketplace packages, not the server's source code. The server is listed in the [MCP Registry](https://registry.modelcontextprotocol.io/v0/servers?search=com.bookla) as `com.bookla/merchant` and can be used two ways:

- **Hosted (recommended):** add `https://mcp.bookla.com/mcp` as a remote MCP server in any client that supports OAuth. The merchant signs in as above.
- **Local:** run the [`@bookla-app/mcp`](https://www.npmjs.com/package/@bookla-app/mcp) npm package over stdio with a merchant API key:

  ```json
  {
    "mcpServers": {
      "bookla": {
        "command": "npx",
        "args": ["-y", "@bookla-app/mcp"],
        "env": {
          "BOOKLA_API_KEY": "<merchant API key from Settings > API Keys>",
          "BOOKLA_API_URL": "https://eu.bookla.com/api/v1"
        }
      }
    }
  }
  ```

  Use `https://us.bookla.com/api/v1` for US accounts.

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

Each plugin carries its own copy of the `bookla-merchant` skill (`<provider>/bookla/skills/bookla-merchant/SKILL.md`), because each marketplace packages only its own plugin directory. Edit all copies together. `scripts/check-shared.sh` fails if they differ.

## Adding a provider

1. Create `<provider>/` with that marketplace's package format.
2. Point the MCP config at `https://mcp.bookla.com/mcp`.
3. Check how the client gets an OAuth client ID: a Client ID Metadata Document (as Antigravity does) or a fixed public client ID (as Cursor does). Either one must be enabled on the Bookla authorization server first. Dynamic client registration is not supported.
4. Add a row to the table above.

## Support

support@bookla.com · [docs.bookla.com](https://docs.bookla.com/)
