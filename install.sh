#!/bin/bash

scripts=("capra-bash" "capra-create")

for script in "${scripts[@]}"; do
    src=$(pwd)/$script.sh
    dest=/usr/local/bin/$script

    info=''
    if [ -e $dest ]; then
        rm $dest
        info='(previous version removed)'
    fi

    chmod +x $src
    cp $src $dest
    echo $dest created $info
done
