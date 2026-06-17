# AGENTS.md — kickstart.nvim

## Entrypoint

- `init.lua` is the sole entrypoint — read it first to understand the full config.
- Optional plugin modules live under `lua/kickstart/plugins/` and are loaded explicitly near the bottom of `init.lua` (e.g. `require 'kickstart.plugins.debug'`).

## Plugin manager

- Uses **`vim.pack`** (Neovim 0.12+ built-in), **not** lazy.nvim or packer.
- Install: `vim.pack.add { 'https://github.com/user/repo' }`
- Multiple plugins: `vim.pack.add { repo1, repo2 }`
- With options: `vim.pack.add { { src = url, name = alias, version = range } }`
- Plugin updates: `:lua vim.pack.update()` — inspect pending changes with `:lua vim.pack.update(nil, { offline = true })`

## Custom / personal plugins

- `lua/custom/plugins/` is a merge-conflict-free zone.
- Each `*.lua` file there is auto-loaded by `lua/custom/plugins/init.lua`.
- ToggleTerm + LazyGit/OpenCode shortcuts are configured in `lua/custom/plugins/toggleterm.lua`.

## Formatting (StyLua)

- Run `stylua --check .` to verify formatting (CI does this on every PR).
- Config: `.stylua.toml` — 160 col width, spaces, 2-space indent, single quotes, no call parentheses, collapse simple statements.

## Key architecture notes

- Colorscheme: **catppuccin** (frappe flavour, transparent). Set in `init.lua:386-399`.
- Autocomplete: **blink.cmp** with Luasnip snippets. Fuzzy matcher defaults to Lua (not Rust).
- File finder: **Telescope** with fzf-native (requires `make`). Bound to `<leader>s*` prefix.
- Tree explorer: **neo-tree** bound to `\` key.
- Format on save: **conform.nvim** — only lua, python, typescript by default.
- Debug: **nvim-dap** + **nvim-dap-ui** (in `lua/kickstart/plugins/debug.lua`).
- Linting: **nvim-lint** (markdown only by default).

## Build requirements

- `make` is required for `telescope-fzf-native.nvim` and LuaSnip's `jsregexp` build steps.
- External deps checked by health: `git`, `make`, `unzip`, `rg`.
- LSP and tools auto-installed via Mason (`pyright`, `vtsls`, `lua_ls`, `stylua`).

## Testing & verification

- No test framework. Run `:checkhealth` inside Neovim to verify setup.
- Smoke test: `nvim --headless +"lua vim.pack.update(nil, { offline = true })" +qa`
- LSP/Treesitter can be tested by opening a file of the relevant language.

## CI

- `.github/workflows/stylua.yml` runs `stylua --check .` on `pull_request_target`.
- Only runs on the upstream repo (`nvim-lua/kickstart.nvim`), not forks.
