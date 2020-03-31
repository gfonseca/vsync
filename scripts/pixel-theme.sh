#!/bin/bash

install_pixel_theme(){
    PIXEL_REPO_URL=$1
    THEME_CLONE_DIR=$2
    
    rm -rf $THEME_CLONE_DIR
    mkdir -p $THEME_CLONE_DIR
    echo "> Instaling theme Pixel"
    git clone -C / $PIXEL_REPO_URL $THEME_CLONE_DIR
    if[ $? -ne 0 ]; then
        echo "Failed preparing dir $THEME_CLONE_DIR"
        return 1
    fi
    echo "> Pixel done"
}