sudo pacman --noconfirm --needed -Syu neovim zsh tmux stow

cp -r .zsh ~/ && cp .zshenv ~/ && mkdir ~/Pictures/ && cp ARCH.jpg ~/Pictures/ 

nitrogen ~/Pictures/ARCH.jpg

cd .config && cp -r kitty ~/.config/ && cp -r nvim ~/.config/ && cp -r qtile ~/.config/ 

cd .. && stow --adopt .
