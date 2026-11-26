# Neorg setup

[neorg](https://github.com/nvim-neorg/neorg) depends on luarocks packages, including its
tree-sitter parsers (`norg`, `norg_meta`). lazy.nvim installs them with its own Lua 5.1 +
luarocks, which it builds itself (`rocks.hererocks = true` in `lua/core/lazy.lua`).

## macOS

Nothing to do. Open Neovim and let lazy.nvim install everything.

## Linux (most distros)

lazy's Lua build needs the readline headers. If `:Lazy` shows
`fatal error: readline/readline.h: No such file or directory`, install your distro's
readline dev package (`libreadline-dev` on Debian/Ubuntu, `readline-devel` on Fedora,
`readline` on Arch), then run `:Lazy build hererocks` and restart Neovim.

## NixOS

After a fresh install, open Neovim once, let lazy.nvim install the plugins (ignore the
`hererocks` failure), then run:

```sh
~/.config/nvim/docs/neorg-nixos-setup.sh
```

and restart Neovim. It needs `python3`, `git`, `cc` and `c++`. It's safe to run again,
e.g. if neorg's parsers stop loading after deleting `~/.local/share/nvim`.

It fixes two NixOS problems:

1. **lazy's Lua build fails** with `readline/readline.h: No such file or directory`:
   NixOS has no readline headers where the build looks. The script builds it without
   readline (`hererocks --no-readline`), which lazy only uses for luarocks anyway.
2. **The prebuilt norg parsers don't load**:
   `uv_dlopen: libstdc++.so.6: cannot open shared object file`. lazy downloads parsers
   built for regular Linux, which expect `libstdc++` in standard system folders that
   NixOS doesn't have. The script compiles them locally into
   `~/.local/share/nvim/site/parser/`, where they link to the Nix store's `libstdc++`.

### Why `configure_parsers = false` (in `lua/plugins/neorg.lua`)

By default neorg loads its parsers itself, from Lua's library path, where lazy puts the
prebuilt ones from `lazy-rocks`. On NixOS that picks the broken parser, and whether it
happens depends on plugin load order, so the error showed up only on some starts:

```
Failed to run `config` for neorg
... Failed to load parser for language 'norg': uv_dlopen: libstdc++.so.6: ...
```

With `configure_parsers = false`, Neovim loads the parsers through its runtimepath, which
checks `site/parser` (the compiled ones) before `lazy-rocks`. On macOS it finds the
prebuilt ones in `lazy-rocks`, which work there.
