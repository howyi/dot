git clone https://github.com/w0ng/vim-hybrid.git
mkdir -p ~/.vim/colors
mv $(PWD)/vim-hybrid/colors/hybrid.vim ~/.vim/colors/
rm -rf $(PWD)/vim-hybrid/

ln -sf $(PWD)/.vimrc ~/.vimrc
ln -sf $(PWD)/.zshenv ~/.zshenv
ln -sf $(PWD)/.zshrc ~/.zshrc

ln -sf $(PWD)/.gitconfig ~/.gitconfig

ln -sf $(PWD)/.hammerspoon ~/.hammerspoon
ln -sf $(PWD)/.config ~/.config
