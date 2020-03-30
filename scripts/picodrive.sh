#!/bin/bash

install_picodrive(){
	PICO_REPO_URL=$1
	PICO_CLONE_DIR=$2
	RA_CORE_DIR=$3

	echo "> Instaling Pico Drive"
	echo "> Cloning Pico Drive"

	rm -rf $PICO_CLONE_DIR
	git clone $PICO_REPO_URL $PICO_CLONE_DIR && cd $PICO_CLONE_DIR && git submodule update --init
	if [ $? -ne 0 ] ; then
		echo "Failed to clone git repository for Pico Drive" 
		return 1
	fi

	echo "> Building..."
	cd $PICO_CLONE_DIR && ./configure && make -f Makefile.libretro clean && make -f Makefile.libretro platform=unix
	if [ $? -ne 0 ] ; then
		echo "Failed in Building process" 
		return 1
	fi

	mkdir -p $RA_CORE_DIR && cp -rfv $PICO_CLONE_DIR/picodrive_libretro.so  $RA_CORE_DIR
	rm -rf $PICO_CLONE_DIR
	echo "> Pico Drive done"
}