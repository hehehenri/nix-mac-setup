{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs";
	};

	outputs = { self, nixpkgs }: {
		packages."aarch64-darwin".default = 
		let 
			pkgs = nixpkgs.legacyPackages."aarch64-darwin";
		in
		pkgs.buildEnv {
			name = "home-packages";
			paths = with pkgs; [
				# shell related
				git
				gh
				tmux
				devenv

				# neovim and dependencies
				neovim
				ripgrep

				# languages and stuff
				nodejs
				bun
				go

				# macOS related
				yabai
				skhd
			];
		};
	};
}
