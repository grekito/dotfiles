sudo pacman --noconfirm --needed -Syu neovim

mkdir -p ~/.config/nvim/lua/costa/

cp .config/nvim/lua/costa/init.lua ~/.config/nvim/lua/costa/init.lua
cp .config/nvim/init.lua ~/.config/nvim/

nvim

# cp -r .config/nvim ~/.config/nvim

