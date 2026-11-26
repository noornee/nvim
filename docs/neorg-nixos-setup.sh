#!/usr/bin/env bash
# One-time neorg setup for NixOS. Run it after a fresh install, once lazy.nvim has
# installed the plugins (open Neovim once and let it finish). Safe to run again.
# Why this is needed: see docs/neorg.md.
set -euo pipefail

data="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
lazy="$data/lazy"

for dir in hererocks tree-sitter-norg tree-sitter-norg-meta; do
	if [ ! -d "$lazy/$dir" ]; then
		echo "error: $lazy/$dir is missing. Open Neovim and let lazy.nvim install plugins first." >&2
		exit 1
	fi
done

# 1. lazy.nvim's own Lua 5.1 + luarocks, built without readline.
#    lazy builds it with readline, which fails on NixOS (no readline headers).
hererocks="$data/lazy-rocks/hererocks"
if [ -x "$hererocks/bin/luarocks" ]; then
	echo "==> hererocks: already built, skipping"
else
	echo "==> hererocks: building Lua 5.1 + luarocks without readline"
	rm -rf "$hererocks"
	(cd "$lazy/hererocks" && python3 hererocks.py -l 5.1 -r latest --no-readline "$hererocks")
fi

# 2. The norg tree-sitter parsers, compiled locally. The prebuilt ones lazy downloads
#    can't find libstdc++.so.6 on NixOS. Neovim loads parsers from site/parser before
#    lazy-rocks, and plugin updates don't touch this folder.
#    Versions match the ones neorg's rockspec pins.
parsers="$data/site/parser"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$parsers"

echo "==> norg parser (tree-sitter-norg v0.2.6)"
git -C "$lazy/tree-sitter-norg" archive v0.2.6 src | tar -x -C "$tmp" --one-top-level=norg
(
	cd "$tmp/norg"
	cc -O2 -fPIC -Isrc -c src/parser.c -o parser.o 2>/dev/null
	c++ -O2 -fPIC -Isrc -c src/scanner.cc -o scanner.o
	c++ -shared parser.o scanner.o -o norg.so
)

echo "==> norg_meta parser (tree-sitter-norg-meta v0.1.0)"
git -C "$lazy/tree-sitter-norg-meta" archive v0.1.0 src | tar -x -C "$tmp" --one-top-level=norg_meta
(
	cd "$tmp/norg_meta"
	cc -O2 -fPIC -Isrc -c src/parser.c -o parser.o
	cc -shared parser.o -o norg_meta.so
)

# Move into place (replacing a parser a running Neovim has loaded in place would crash it)
mv "$tmp/norg/norg.so" "$parsers/norg.so"
mv "$tmp/norg_meta/norg_meta.so" "$parsers/norg_meta.so"

echo "==> done. Restart Neovim."
