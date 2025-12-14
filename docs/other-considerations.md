```nix
diffview.enable = true; # Git diff viewer
coq.enable = true; # Just want something out of box
refactoring.enable = true; # Refactoring utilities
nvim-lightbulb.enable = true; # Code action indicator

# Might needto enable some kind of testing here
dap.enable = true;
    dap-python.enable = true;
    dap-ui.enable = true;
    neotest = {
      enable = true;
      adapters.python.enable = true;
};

lean.enable = true; # LEAN theorem prover

schemastore = {enable = true; yaml.enable = true; json.enable = true;}; # JSON/YAML schema support
csvview.enable = true; # CSV file viewer


# Some kind of terminal toggle?
# (mkKeymap "n" "<c-/>" "<cmd>:lua Snacks.terminal()<cr>" "Toggle Terminal")
toggleterm.enable = true; # Toggle terminal splits

remote-nvim.enable = true; # Devcontainer and remote work
wakatime.enable = true; # Time tracking
iron.enable = true; # Interactive REPLs
img-clip.enable = true; # Drag-and-drop images for Typst, LaTeX

# wilder.enable = true; # Enhanced wildmenu (apparenlty cmp-cmdline recommended?)
vim-be-good.enable = true; # Vim practice games
```

I think this setup is using some kind of snacks debug.



Also considered but less so:
```nix

    # ==========================================================================
    # CONSIDERING
    # Plugins to potentially enable in the future
    # ==========================================================================
    #
    # -- Startup Screens --
    # alpha.enable = true; # not working?                    # Startup screen (errors on empty config)
    # dashboard                               # https://nix-community.github.io/nixvim/plugins/dashboard/index.html
    # vim-startify                            # https://github.com/mhinz/vim-startify/
    #
    # -- UI Enhancements --
    # notify.enable = true;                   # Notifications (snacks-nvim has its own)
    smear-cursor.enable = true;             # Smear cursor effect (mini has this)
    # color-winsep                            # Colorizes window separators
    # scrollview                              # https://github.com/dstein64/nvim-scrollview/
    # twilight                                # https://github.com/folke/twilight.nvim/ - Dims inactive code
    #
    # -- Navigation --
    # flash                                   # https://github.com/folke/flash.nvim/ - Label-based search navigation
    # harpoon                                 # https://nix-community.github.io/nixvim/plugins/harpoon/index.html
    #
    # -- File Explorers --

    # nvim-tree                               # https://nix-community.github.io/nixvim/plugins/nvim-tree/index.html
    oil.enable = true;                                     # https://github.com/stevearc/oil.nvim - Edit filesystem like buffer
    # yazi                                    # https://github.com/mikavilpas/yazi.nvim/
    #
    # -- Git --
    # fugit2                                  # https://nix-community.github.io/nixvim/plugins/fugit2/index.html - Git GUI
    # fugitive                                # https://nix-community.github.io/nixvim/plugins/fugitive.html - Tim Pope's git wrapper
    # neogit                                  # https://github.com/NeogitOrg/neogit/
    # lazygit                                 # https://github.com/kdheepak/lazygit.nvim/ (snacks has this)
    #
    # -- AI --
    # opencode                                # https://nix-community.github.io/nixvim/plugins/opencode/index.html
    # sidekick                                # https://github.com/folke/sidekick.nvim/
    # supermaven                              # https://supermaven.com/
    #
    # -- Editing --
    # goto-preview                            # https://nix-community.github.io/nixvim/plugins/goto-preview/index.html
    # undotree                                # https://github.com/mbbill/undotree/
    # vim-surround                            # https://github.com/tpope/vim-surround/ (mini has this)
    # vim-sandwich                            # https://github.com/machakann/vim-sandwich/
    # vim-repeat                              # https://github.com/tpope/vim-repeat/
    # vim-sleuth                              # https://github.com/tpope/vim-sleuth/
    # yanky                                   # https://github.com/gbprod/yanky.nvim/
    # visual-multi                            # https://github.com/mg979/vim-visual-multi/ - Multi-cursor
    #
    # -- Mini.nvim Suite --
    # mini.enable = true;                     # Lots of small improvements:
    #   - Better around/inside textobjects
    #   - Surround (replaces vim-surround)
    #   - Animated cursor
    #   - Mini.files, mini.pick, etc.
    #
    # -- Code Quality --
    # conform-nvim                            # https://nix-community.github.io/nixvim/plugins/conform-nvim/index.html
    # lint                                    # https://nix-community.github.io/nixvim/plugins/lint/index.html
    # quicker                                 # https://nix-community.github.io/nixvim/plugins/quicker/index.html
    #
    # -- LSP Related --
    # helpview                                # https://github.com/OXY2DEV/helpview.nvim/
    hmts.enable = true;                                    # https://nix-community.github.io/nixvim/plugins/hmts/index.html - Treesitter for home-manager
    #
    # -- Testing --
    # vim-test                                # https://nix-community.github.io/nixvim/plugins/vim-test.html
    #
    # -- Languages --
    # vimtex                                  # https://github.com/lervag/vimtex/
    # molten-nvim                             # https://github.com/benlubas/molten-nvim/ - Jupyter in nvim
    #
    # -- Integration --
    # direnv                                  # https://nix-community.github.io/nixvim/plugins/direnv/index.html
    # distant                                 # https://github.com/chipsenkbeil/distant.nvim/ - Remote editing
    # firenvim                                # https://github.com/glacambre/firenvim/ - Nvim in browser
    # presence                                # https://github.com/andweeb/presence.nvim/ - Discord status
    #
    # -- Misc --
    # colorful-menu                           # https://github.com/xzbdmw/colorful-menu.nvim/
    # comment-box                             # https://github.com/LudoPinelli/comment-box.nvim/
    # lazy                                    # https://nix-community.github.io/nixvim/plugins/lazy/index.html
    # neoconf                                 # https://nix-community.github.io/nixvim/plugins/neoconf/index.html
    # neoclip                                 # https://github.com/AckslD/nvim-neoclip.lua/
    # nerdy                                   # https://nix-community.github.io/nixvim/plugins/nerdy/index.html - Nerd font search
    # smart-splits                            # https://nix-community.github.io/nixvim/plugins/smart-splits/index.html
```