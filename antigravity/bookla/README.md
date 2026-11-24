# Bookla for Antigravity

Manage your [Bookla](https://bookla.com) booking business from the Antigravity agent. Ask about bookings, availability, services, resources, clients, pricing, gift cards, subscriptions, payments and reports, or make changes to them.

## What's included

- **MCP server `bookla`**: the hosted Bookla merchant MCP server at `https://mcp.bookla.com/mcp`. It covers bookings, availability, working hours and closing periods, services, resources, tickets, capacity rules, clients, price rules, discounts, promo codes, gift cards, subscriptions, payments, refunds, monthly reports, the activity log and plugins.
- **Skill `bookla-merchant`**: tells the agent how to use the tools safely. It finds the company and its time zone first, checks availability before booking, and confirms before any change.

## Requirements

- A Bookla merchant account in the EU or US region (<https://bookla.com>).

## Setup

1. Install **Bookla** from the Antigravity Marketplace.
2. In the Antigravity App, open **Customizations → Installed**. Under **MCP Servers**, click **Authenticate** next to the Bookla server.
3. Sign in with your Bookla account in the browser. Choose your region, the companies to share, and whether the connection is read-only.
4. Copy the authorization code Antigravity shows, paste it into **Enter authorization code**, and click **Submit**.

No API key is needed, and none is stored in Antigravity. To disconnect, sign out of the server in Antigravity or revoke it in your Bookla dashboard.

## Example prompts

- "What bookings do I have today?"
- "What times are free for the tennis court next Friday afternoon?"
- "Book a massage for jane@example.com tomorrow at 3pm."
- "Close Court 2 for maintenance next Monday."
- "Make James work 9–17 on weekdays."
- "Show last month's accounting report."

## Privacy and data

The plugin sends requests only to Bookla's API, using the access you granted. Bookla handles the data under its [privacy policy](https://eu-platform.bookla.com/privacy) and [terms](https://eu-platform.bookla.com/terms).

## Support

support@bookla.com · [docs.bookla.com](https://docs.bookla.com/)

## License

MIT
