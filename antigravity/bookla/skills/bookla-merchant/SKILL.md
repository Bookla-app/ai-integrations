---
name: bookla-merchant
description: Work with a Bookla merchant account through the Bookla MCP server - bookings, availability, schedules, services, resources, clients, pricing, gift cards, subscriptions, payments and reports. Use when the user asks about their Bookla business data or wants to change it.
---

# Bookla merchant

The `bookla` MCP server connects the agent to the user's Bookla merchant account. The user signs in with their Bookla account. On the consent screen they pick which companies to share and whether the connection is read-only.

## Ground rules

1. **Find the company first.** Nearly every tool takes a `company_id`. Call `list_companies`. If there is more than one company, ask which one, unless the request makes it clear.
2. **Use the company's time zone.** Call `get_company` to read it. Read "today", "tomorrow" and "next Friday" in that time zone, not the user's machine time. Dates and times are RFC3339, and durations are ISO 8601, for example `PT1H`.
3. **Confirm before writing.** Before you create, change or delete anything, say exactly what will change (which record, the old value and the new one) and wait for a yes. Reads need no confirmation.
4. **Look up IDs, don't guess them.** Resolve names to IDs with the list and search tools (`list_services`, `list_resources`, `search_clients`, `get_bookings`, and so on).
5. **Read-only connections.** If write tools are missing or return a permission error, the connection is read-only or doesn't cover that company. Tell the user they can reconnect and grant write access. Don't look for another way to make the change.

## Common workflows

### Create a booking

1. `list_companies`, then `list_services` to find the service.
2. `search_clients` to find the client. Call `create_client` only if none exists, and only after the user confirms.
3. `get_available_times` for the requested window. If the requested time isn't free, offer the nearest free times and don't book.
4. For a promo code, preview it with `validate_code` first.
5. Confirm the details with the user, then call `create_booking`.

### Change availability

- Close a resource for a period, such as maintenance or a holiday: `list_resources`, then `create_closing_period`.
- Set regular hours: `list_resources`, then `create_working_hours` (or `update_working_hours`). Check the current rules with `list_working_hours` first, so you don't create a duplicate.
- See the schedule across several resources: `list_working_hours_in_range` and `list_closing_periods_in_range`.

### Move or cancel a booking

- Move: `get_booking`, check the new time with `get_available_times`, then `move_booking`.
- Cancel: `get_booking`, then `update_booking` with the cancelled status. Ask the user how much to refund (`refundPercent`) when the booking was paid. `delete_booking` can't be undone, so use it only when the user explicitly asks for the booking to be deleted.

### Reporting

- Bookings in a period: `get_bookings` with a date range.
- Money: `get_payments`, `list_refunds`, and `get_monthly_report` for the monthly accounting report.
- Who changed what: `get_activity`.

## Presenting results

- Show times in the company's time zone and say which zone it is.
- Amounts you pass to tools are in minor units (cents): `1500` means 15.00.
- Summarise long lists: give counts and the most relevant rows, and offer the full list.
