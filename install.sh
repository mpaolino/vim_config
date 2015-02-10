git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/scrooloose/nerdtree.git ~/vim/bundle/nerdtree

cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install

cd ~/
vim +BundleInstall +qall
vim +PluginInstall +qall

if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.old
fi

ln -s .vimrc ~/
