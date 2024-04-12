{ pkgs, ... }:

{
	home.username = "thomas";
	home.homeDirectory = "/home/thomas";

	programs.bash = {
		enable = true;
		enableCompletion = true;
		bashrcExtra = ''
			export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
		'';
		
	};
       home.stateVersion = "23.11";
       programs.home-manager.enable = true;
}
