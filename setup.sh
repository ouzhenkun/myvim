#!/bin/bash

backup() {
    today=`date +%Y%m%d_%s`
    echo "Backing up current vim stuff > xxx.$today"
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc
    do
        [ -e $i ] && cp -rf $i $i.$today
    done
}

install() {
    # Use CTRL-S for saving, also in Insert mode
    echo "alias vim=\"stty stop '' -ixoff; vim\"" >> $HOME/.bash_profile
    ln -sf $HOME/myvim/.vimrc $HOME/.vimrc
    mkdir -p $HOME/.vim/bundle
    rm -rf $HOME/.vim/bundle/*
    while read line; do
        echo "Installing plugin $line"
        cd $HOME/.vim/bundle
        git clone "https://github.com/$line"
    done < .vimrc.bundle
}

echo "Installing... "
backup
install
echo "Done!"
