#!/bin/bash

backup() {
    echo "Backing up current vim config..."
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc
    do
        [ -e $i ] && cp -f $i $i.backup
    done
}

install() {
    # Use CTRL-S for saving, also in Insert mode
    echo "alias vim=\"stty stop '' -ixoff; vim\"" >> $HOME/.bash_profile
    ln -sf $HOME/myvim/.vimrc $HOME/.vimrc
    mkdir -p $HOME/.vim/bundle
    while read line; do
        echo "Installing plugin $line ..."
        cd $HOME/.vim/bundle
        git clone "https://github.com/$line"
    done < .vimrc.bundle
}

echo "Installing... "
backup
install
echo "Done!"
