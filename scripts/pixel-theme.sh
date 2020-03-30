#!/bin/bash

install_pixel_theme(){
    PIEL_REPO_URL=$1
    THEME_CLONE_DIR=$2
    
    rm -rf $THEME_CLONE_DIR
    mkdir -p $THEME_CLONE_DIR
    echo "> Instaling theme Pixel"
    git clone https://github.com/RetroPie/es-theme-pixel $THEME_CLONE_DIR
    echo "> Pixel done"
}