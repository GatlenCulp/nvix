{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      # nil_ls = {
      #   enable = true;
      # };
      nixd.enable = true;
      statix.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.nix = [ "nixfmt" ];
      formatters.nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
    };
  };
}
