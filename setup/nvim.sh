set -e

brew install neovim
brew install ripgrep
brew install fd
brew install fzf

mkdir -p ~/.config/nvim
cp -rf ../nvim/init.lua ~/.config/nvim/init.lua
