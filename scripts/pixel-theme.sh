#!/bin/bash

install_pixel_theme(){
    PIXEL_REPO_URL=$1
    THEME_CLONE_DIR=$2
    
    rm -rf $THEME_CLONE_DIR
    echo -e "\n> Instaling theme Pixel"
    git -C / clone $PIXEL_REPO_URL $THEME_CLONE_DIR
    if [ $? -ne 0 ]; then
        echo "Failed preparing dir $THEME_CLONE_DIR"
        return 1
    fi
    echo "> Pixel done"
}