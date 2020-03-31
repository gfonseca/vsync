#!/bin/bash

install_emulationstation(){
	BASEDIR=$1
	ES_REPO_URL=$2
	ES_CLONE_DIR=$3
	ES_CONFIG_DIR=$4

	echo "> Instaling Emulation Station"
	echo "> Cloning Emulation Station to $ES_CLONE_DIR"

	rm -rf $ES_CLONE_DIR
	git -C / clone $ES_REPO_URL $ES_CLONE_DIR

	if [ $? -ne 0 ] ; then
		echo "Failed to clone git repository for Emulation Station" 
		return 1
	fi

	sudo apt install -y \
	 libsdl2-dev \
	 libboost-system-dev \
	 libboost-filesystem-dev \
	 libboost-date-time-dev \
	 libboost-locale-dev \
	 libfreeimage-dev \
	 libfreetype6-dev \
	 libeigen3-dev \
	 libcurl4-openssl-dev \
	 libasound2-dev \
	 libsdl-image1.2-dev \
	 libsdl-dev \
	 libgl1-mesa-dev \
	 build-essential \
	 cmake \
	 fonts-droid-fallback

	if [ $? -ne 0 ] ; then
		echo "Failed installing dependencies for Emulation Station" 
		return 1
	fi

	echo "> Building..."
	cd $ES_CLONE_DIR && cmake ./ && make
	if [ $? -ne 0 ] ; then
		echo "Failed in Building process" 
		return 1
	fi

	cd $ES_CLONE_DIR && chmod +x ./emulationstation && sudo cp -rfv ./emulationstation /usr/local/bin/emulationstation
	mkdir -p $ES_CONFIG_DIR && cp $BASEDIR/conf/es_systems.cfg $ES_CONFIG_DIR
	rm -rf $ES_CLONE_DIR
	return 0
}