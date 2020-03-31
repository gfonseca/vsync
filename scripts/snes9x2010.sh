#!/bin/bash

install_snes9x2010(){
	SNES9X_REPO_URL=$1
	SNES9X_CLONE_DIR=$2
	RA_CORE_DIR=$3
	RA_CORE_NAME="SNES9X2010"


	echo "> Instaling $RA_CORE_NAME"
	echo "> Cloning $RA_CORE_NAME"
	rm -rf $SNES9X_CLONE_DIR
	git -C / clone $SNES9X_REPO_URL $SNES9X_CLONE_DIR
	if [ $? -ne 0 ] ; then
		echo "Failed to clone git repository for $RA_CORE_NAME" 
		return 1
	fi

	echo "> Building..."
	cd $SNES9X_CLONE_DIR
	make clean && make
	if [ $? -ne 0 ] ; then
		echo "Failed in Building process" 
		return 1
	fi

	mkdir -p $RA_CORE_DIR && cp -rfv $SNES9X_CLONE_DIR/snes9x2010_libretro.so $RA_CORE_DIR
	rm -rf $SNES9X_CLONE_DIR
	echo "> $RA_CORE_NAME done"
}