#!/usr/bin/env bash
# Fails if the copies of the shared Bookla skill differ between providers.
set -euo pipefail
cd "$(dirname "$0")/.."
ref=cursor/bookla/skills/bookla-merchant/SKILL.md
status=0
for f in */bookla/skills/bookla-merchant/SKILL.md; do
  if ! cmp -s "$ref" "$f"; then
    echo "out of sync: $f differs from $ref" >&2
    status=1
  fi
done
[ $status -eq 0 ] && echo "shared skill in sync"
exit $status
