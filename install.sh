sudo pacman --noconfirm --needed -Syu neovim zsh tmux stow

cp -r .zsh ~/ && cp .zshenv ~/ 

cd .config && cp -r kitty ~/.config/ && cp nvim ~/.config/ && cp qtile ~/.config/ 

cd .. && stow --adopt .



