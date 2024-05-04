sudo pacman --noconfirm --needed -Syu neovim

mkdir -p ~/.config/nvim/lua/costa/

cp .config/nvim/lua/costa/init.lua ~/.config/nvim/lua/costa/

nvim

vim.cmd :Lazy
vim.cmd :q

# cp -r .config/nvim ~/.config/nvim

