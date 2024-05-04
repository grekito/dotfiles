sudo pacman --noconfirm --needed -Syu neovim zsh tmux stow eza unzip npm

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

chsh -s /usr/bin/zsh

cp -r .zsh ~/ && cp .zshenv ~/ && mkdir ~/Pictures/ && cp arch.jpg ~/Pictures/arch.jpg

nitrogen ~/Pictures/

cd .config && cp -r kitty ~/.config/ && cp -r nvim ~/.config/ && cp -r qtile ~/.config/ && cp tmux/tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.config/tmux/plugins && cd ~/.config/tmux/plugins/ && git clone https://github.com/tmux-plugins/tpm

mkdir -p ~/.zsh/plugins/ && cd ~/.zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
