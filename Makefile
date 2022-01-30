KATACODACODE_DIR := /opt/.katacodacode/user-data/User/

install: copy-configs-to-system apt-install snap-install

# ranger tig tmux
apt-install:
	sudo apt update
	sudo apt -y install curl ansible \
		apt-transport-https ca-certificates software-properties-common \
		tmux neovim ncdu tldr fzf

# copy-configs-from-system:
# 	mkdir -p .config/Code/User/snippets/ \
# 		&& cp -R ~/.config/Code/User/snippets/ .config/Code/User/
# 	cp ~/.config/Code/User/keybindings.json .config/Code/User/
# 	cp ~/.config/Code/User/settings.json .config/Code/User/
# 	cp -R ~/.config/nvim/ .config/
# 	cp -R ~/.config/ranger/ .config/
# 	cp -R ~/.config/tmux .config/
# 	cp ~/.config/starship.toml .config/

copy-configs-to-system:
	cp -R .config/ ~/.config/
	mkdir -p "$$KATACODACODE_DIR" \
		&& cp -R .config/Code/User/* "$$KATACODACODE_DIR"

ripgrep-workaround:
	apt-get download ripgrep
	sudo dpkg --force-overwrite -i ripgrep*.deb
	rm ripgrep*.deb

bat-workaround:
	sudo apt -y install bat
	sudo ln -s /usr/bin/batcat /usr/local/bin/bat
