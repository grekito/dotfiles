sudo pacman --noconfirm --needed -Syu neovim zsh tmux stow

cp -r .zsh ~/ && cp .zshenv ~/ && mkdir ~/Pictures/ && cp arch.jpg ~/Pictures/arch.jpg

nitrogen ~/Pictures/arch.jpg

cd .config && cp -r kitty ~/.config/ && cp -r nvim ~/.config/ && cp -r qtile ~/.config/ 

mkdir -p ~/.config/tmux/plugins && cd ~/.config/tmux/plugins/ && git clone https://github.com/tmux-plugins/tpm
