# NEOVIM SETUP

## PLUGINS USED

managed with [Lazy](https://github.com/folke/lazy.nvim)

### GENERAL PURPOSE PLUGINS

| Plugin                                                                                      | Purpose                                        |
| ------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| [Autoclose](https://github.com/m4xshen/autoclose.nvim)                                      | Auto close pairings for quotes, brackets, etc. |
| [Comment](https://github.com/numToStr/Comment.nvim)                                         | Easily toggle if line is commented             |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)                                      | Show git changes in buffer                     |
| [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)                                      | Color Scheme                                   |
| [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)                  | Show tab spaces                                |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim)                                     | Status Line                                    |
| [Nord](https://github.com/shaunsingh/nord.nvim)                                             | Color Scheme                                   |
| [NVIM Tree](https://github.com/nvim-tree/nvim-tree.lua)                                     | File explorer panel                            |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim)                               | File searching                                 |
| [Telescope File Browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)     | File browser for telescope                     |
| [Telescope UI Select](https://github.com/nvim-telescope/telescope-ui-select.nvim)           | UI for selecting code actions                  |
| [Telescope Live Grep Args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim) | Grep with arguments                            |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                            | Code highlighting                              |

### SNIPPETS PLUGINS

| Plugin                                                                                | Purpose                             |
| ------------------------------------------------------------------------------------- | ----------------------------------- |
| [CMP](https://github.com/hrsh7th/nvim-cmp)                                            | Auto complete                       |
| [Cmp-Buffer](https://github.com/hrsh7th/cmp-buffer)                                   | Souce for buffer                    |
| [Cmp-Cmdline](https://github.com/hrsh7th/cmp-cmdline)                                 | Souce for vim's command line        |
| [Cmp-LuaSnip](https://github.com/saadparwaiz1/cmp_luasnip)                            | Source for LuaSnip                  |
| [Cmp-Nvim-Lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                               | Souce for Nvim's built in LS client |
| [Cmp-Nvim-Lsp-Signature-Help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) | Display function signatures         |
| [Cmp-Path](https://github.com/hrsh7th/cmp-path)                                       | Souce for path                      |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                        | Snippet engine                      |

### LSP SPECIFIC PLUGINS

| Plugin                                                                  | Purpose                                 |
| ----------------------------------------------------------------------- | --------------------------------------- |
| [Mason](https://github.com/williamboman/mason.nvim)                     | Package manager                         |
| [Mason LspConfig](https://github.com/williamboman/mason-lspconfig.nvim) | Auto install language servers via Mason |
| [Nvim LspConfig](https://github.com/neovim/nvim-lspconfig)              | LSP client configs                      |

### LINTER/FORMATTER SPECIFIC PLUGINS

| Plugin                                                                               | Purpose                                     |
| ------------------------------------------------------------------------------------ | ------------------------------------------- |
| [Mason Tool Installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto install formatters & linters via Mason |
| [None LS](https://github.com/nvimtools/none-ls.nvim)                                 | Inject LSP diagnostics & code actions       |
| [None LS Extras](https://github.com/nvimtools/none-ls-extras.nvim)                   | Extra sources for None LS                   |

## CUSTOM KEYMAPS

| Key               | Function                         |
| ----------------- | -------------------------------- |
| F1                | Clear highlighting               |
| F2                | Toggle comment on one line       |
| F4                | Open current file in Nvim Tree   |
| F5                | Toggle Nvim Tree                 |
| F6                | Set file type to Ansible         |
| F9                | Horizontal resize smaller        |
| F10               | Horizontal resize larger         |
| F11               | Vertical resize smaller          |
| F12               | Vertical resize larger           |
| ff                | Find files                       |
| fg                | Find text in files               |
| fh                | Open help panel                  |
| fb                | Open file browser                |
| gc                | Toggle comment on selection      |
| gcc               | Toggle comment on current line   |
| gD                | Go to declaration                |
| gd                | Go to definition                 |
| K                 | Show hover information           |
| \<leader\>ca      | Show code actions                |
| \<leader\>gf      | Format file                      |
| \<leader\>ne      | Go to next diagnostic            |
| \<leader\>pe      | Go to previous diagnostic        |
| \<leader\>fe      | Float info of current diagnostic |
| ALT+,             | Go to previous buffer tab        |
| ALT+.             | Go to next buffer tab            |
| ALT+<             | Move buffer tab left             |
| ALT+>             | Move buffer tab right            |
| ALT+p             | Pin buffer tab                   |
| ALT+c             | Close buffer tab                 |
| \<leader\>\<num\> | Focus tab \<num\>                |

## FORMATTERS AND LINTERS

| Tool         | Language             | Purpose            |
| ------------ | -------------------- | ------------------ |
| hadolint     | docker               | Linter             |
| markdownlint | markdown             | Linter             |
| prettierd    | html, json, markdown | Formatter          |
| pylint       | python               | Formatter & Linter |
| stylua       | lua                  | Formatter          |
| shfmt        | bash                 | Formatter          |
| yamlfmt      | yaml                 | Formatter          |
| yamllint     | yaml                 | Linter             |

## LANGUAGE SERVERS

| Server Name | Language  |
| ----------- | --------- |
| lua_ls      | lua       |
| pylsp       | python    |
| terraformls | terraform |
| yamlls      | yaml      |
| ansiblels   | ansible   |
