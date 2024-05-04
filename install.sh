sudo pacman --noconfirm --needed -Syu neovim

mkdir -p ~/.config/nvim/lua/costa/

cp .config/nvim/lua/costa/lazy.lua ~/.config/nvim/lua/costa/lazy.lua
cp .config/nvim/init.lua ~/.config/nvim/
cp -r .config/nvim/lua/costa/core ~/.config/nvim/lua/costa/
cp -r .config/nvim/lua/costa/plugins ~/.config/nvim/lua/costa/

nvim

# cp -r .config/nvim ~/.config/nvim

