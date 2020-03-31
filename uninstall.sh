#!/bin/bash

echo "Removing Emulation Station"
rm -rfv /usr/local/bin/emulationstation
if [ $? -ne 0 ]; then
    echo "Failed remove Emulation Station"
    exit 1
fi

echo "Removing Retro Arch"
rm -rfv /usr/local/bin/retroarch && rm -rfv $HOME/.config/retroarch/cores/*
if [ $? -ne 0 ]; then
    echo "Failed removing Retroarch"
    exit 1
fi

echo "All Done !!"
