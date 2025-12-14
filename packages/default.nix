{
  flake,
  inputs',
  self',
  ...
}:
let
  mkNixvim =
    module:
    inputs'.nixvim.legacyPackages.makeNixvimWithModule {
      extraSpecialArgs = { inherit inputs self; };
      inherit module;
    };
  inherit (flake) inputs self;
  bareModules = with self.nvixPlugins; [
    # Core functionality and improvements
    common
    buffer
    ux # better user experience
    snacks
  ];
  coreModules =
    bareModules
    ++ (with self.nvixPlugins; [
      # noice for cmdline
      noice

      # Git and version control
      git

      # UI and appearance
      lualine
      firenvim

      # Code editing and syntax
      treesitter
      blink-cmp
      lang
      lsp

      # Productivity
      autosession
      ai

      smear-cursor
      precognition
      hardtime
    ]);
  fullModules =
    coreModules
    ++ (with self.nvixPlugins; [
      tex
    ]);
in
{
  packages = {
    default = self'.packages.core;
    bare = mkNixvim bareModules;
    core = mkNixvim coreModules;
    full = mkNixvim fullModules;
  };
}
