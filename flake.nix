{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs";
	};

	outputs = { self, nixpkgs }: {
		packages."aarch64-darwin".default = 
		let
			pkgs = nixpkgs.legacyPackages."aarch64-darwin";
			
			# TODO: find a way to use wrangler and pnpm from nix, pinning them to a specific version
			# pnpm = pkgs.nodePackages.pnpm.overrideAttrs (old: rec {
			#   version = "9.3.0";
			#   src = pkgs.fetchurl {
			# 	url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
			# 	sha256 = "woooooo";
			#   };
			# });
			#
			# wrangler = pkgs.nodePackages.wrangler.overrideAttrs (old: rec {
			#   version = "3.58.0";
			#   src = pkgs.fetchurl {
			# 	url = "https://registry.npmjs.org/wrangler/-/wrangler-${version}.tgz";
			# 	sha256 = "sha512-bRe/y/LKjIgp3L2EHjc+CvoCzfHhf4aFTtOBkv2zW+VToNJ4KlXridndf7LvR9urfsFRRo9r4TXCssuKaU+ypQ==";
			#   };
			# });
				
		in pkgs.buildEnv {
			name = "home-packages";
			paths = with pkgs; [
				# tools
				git
				gh
				neovim
				ripgrep
				bun

				# languages
				nodejs
				go
			];
		};
	};
}
