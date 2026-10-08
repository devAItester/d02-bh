#!/usr/bin/env bash
set -euo pipefail

src="${1:?source SVG is required}"
dst="${2:-assets/logo.svg}"

test -f "$src" || { echo "File not found: $src" >&2; exit 1; }
grep -q '<svg' "$src" || { echo "Not an SVG: $src" >&2; exit 1; }

mkdir -p "$(dirname "$dst")"
cp "$src" "$dst"

echo "Created: $dst"
