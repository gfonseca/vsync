#!/bin/bash

BASEDIR=$(dirname $(realpath "$0"))

ES_REPO_URL=https://github.com/Aloshi/EmulationStation
ES_CLONE_DIR=/tmp/emulation-station
ES_CONFIG_DIR=$HOME/.emulationstation/
ES_THEME_DIR=$HOME/.emulationstation/themes

PIXEL_THEME_DIR=$ES_THEME_DIR/pixel/
PIXEL_REPO_URL=https://github.com/RetroPie/es-theme-pixel

RA_REPO_URL=https://github.com/libretro/RetroArch.git
RA_CLONE_DIR=/tmp/retroarch/
RA_CONF_DIR=$HOME/.config/retroarch/
RA_CORE_DIR=$RA_CONF_DIR/cores/

PICO_REPO_URL=https://github.com/libretro/picodrive
PICO_CLONE_DIR=/tmp/picodrive/

SNES9X_REPO_URL=https://github.com/libretro/snes9x2010
SNES9X_CLONE_DIR=/tmp/snes9x/

VBA_REPO_URL=https://github.com/libretro/vba-next
VBA_CLONE_DIR=/tmp/vba_next

PSX_REPO_URL=https://github.com/libretro/beetle-psx-libretro
PSX_CLONE_DIR=/tmp/beetle-psx

source $BASEDIR/scripts/emulationstation.sh
source $BASEDIR/scripts/retroarch.sh
source $BASEDIR/scripts/pixel-theme.sh
source $BASEDIR/scripts/picodrive.sh
source $BASEDIR/scripts/snes9x2010.sh
source $BASEDIR/scripts/vba_next.sh
source $BASEDIR/scripts/beetle-psx.sh


echo "Emulation Station Script + retroarch configuration script"
echo "Starting instalation" 

echo "Instaling Emulation Station"
install_emulationstation $BASEDIR $ES_REPO_URL $ES_CLONE_DIR $ES_CONFIG_DIR $ES
if [ $? -ne 0 ]; then
   echo "Failed to install Emulaton Station"
   exit 1
fi

echo "Instaling Pixel Theme"
install_pixel_theme $PIXEL_REPO_URL $PIXEL_THEME_DIR
if [ $? -ne 0 ]; then
   echo "Failed to install Pixel Theme"
   exit 1
fi

echo "Instaling Retroarch"
install_retroarch $RA_REPO_URL $RA_CLONE_DIR
if [ $? -ne 0 ]; then
   echo "Failed to install Retroarch"
   exit 1
fi

echo "Instaling Retroarch core Picodrive"
install_picodrive  $PICO_REPO_URL $PICO_CLONE_DIR $RA_CORE_DIR
if [ $? -ne 0 ]; then
    echo "Failed to install Picodrive"
    exit 1
fi

echo "Instaling Retroarch core SNES9X"
install_snes9x2010 $SNES9X_REPO_URL $SNES9X_CLONE_DIR $RA_CORE_DIR
if [ $? -ne 0 ]; then
    echo "Failed to install SNES9X"
    exit 1
fi

echo "Instaling Retroarch core vba_next"
install_vba_next $VBA_REPO_URL $VBA_CLONE_DIR $RA_CORE_DIR
if [ $? -ne 0 ]; then
    echo "Failed to install vba_next"
    exit 1
fi

echo "Instaling Retroarch core beetle-psx"
install_beetle-psx $PSX_REPO_URL $PSX_CLONE_DIR $RA_CORE_DIR
if [ $? -ne 0 ]; then
    echo "Failed to install beetle-psx"
    exit 1
fi

echo "> All done"