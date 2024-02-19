{
  description = "nixpkgs-ruby + Bundix";

  inputs = {
    devenv.url = "github:cachix/devenv";
    nixpkgs.url = "github:NixOS/nixpkgs";

    # https://github.com/bobvanderlinden/nixpkgs-ruby
    nixpkgs-ruby = {
      url = "github:bobvanderlinden/nixpkgs-ruby";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        rb = inputs.nixpkgs-ruby.lib.packageFromRubyVersionFile {
          file = ./.ruby-version;
          inherit system;
        };

        gems = pkgs.bundlerEnv {
          name = "nixpkgs-ruby-111-gems";
          gemdir = ./.;
          groups = ["default" "development" "production" "test"];
          extraConfigPaths = [ "${./.}/.ruby-version" ];
        };

        updater = pkgs.writeScriptBin "nixpkgs-ruby-111-gems-update" (builtins.readFile
          (pkgs.substituteAll {
            src = ./nix/update.tmpl.sh;
            bundix = "${pkgs.bundix}/bin/bundix";
            bundler = "${gems.bundler}/bin/bundler";
          }));
      in {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            (final: prev: rec {ruby = rb;})
          ];
        };

        devenv.shells.default = {
          packages = with pkgs; [
            bundix
            gems
            (lowPrio gems.wrappedRuby)
            updater
          ];
        };
      };
    };
}
