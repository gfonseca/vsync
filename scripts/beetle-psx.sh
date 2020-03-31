#!/bin/bash

install_beetle-psx(){
	VBA_REPO_URL=$1
	VBA_CLONE_DIR=$2
	RA_CORE_DIR=$3
	RA_CORE_NAME="bettle-psx"


	echo "> Instaling $RA_CORE_NAME"
	echo "> Cloning $RA_CORE_NAME"
	rm -rf $VBA_CLONE_DIR
	git -C / clone $VBA_REPO_URL $VBA_CLONE_DIR
	if [ $? -ne 0 ] ; then
		echo "Failed to clone git repository for $RA_CORE_NAME" 
		return 1
	fi

	echo "> Building..."
	cd $VBA_CLONE_DIR
	make clean && make
	if [ $? -ne 0 ] ; then
		echo "Failed in Building process" 
		return 1
	fi

	mkdir -p $RA_CORE_DIR && cp -fv $VBA_CLONE_DIR/mednafen_psx_libretro.so $RA_CORE_DIR
	rm -rf $VBA_CLONE_DIR
	echo "> $RA_CORE_NAME done"
}