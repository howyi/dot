git clone https://github.com/w0ng/vim-hybrid.git
mkdir -p ~/.vim/colors
mv ~/dot/vim-hybrid/colors/hybrid.vim ~/.vim/colors/
rm -rf vim-hybrid/

ln -sf ~/dot/.vimrc ~/.vimrc
ln -sf ~/dot/.zshenv ~/.zshenv
ln -sf ~/dot/.zshrc ~/.zshrc

ln -sf ~/dot/.tmux.conf ~/.tmux.conf
mkdir -p ~/.tmux.d
ln -sf ~/dot/.tmux.d/mouse-before-2.0.conf ~/.tmux.d/
ln -sf ~/dot/.tmux.d/mouse-after-2.1.conf ~/.tmux.d/

ln -sf ~/dot/.minttyrc ~/.minttyrc
ln -sf ~/dot/.gitconfig ~/.gitconfig

ln -sf ~/dot/.hammerspoon ~/.hammerspoon
ln -sf ~/dot/.config ~/.config
