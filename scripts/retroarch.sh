#!/bin/bash


install_retroarch(){
	RA_REPO_URL=$1
	RA_CLONE_DIR=$2

	echo $ES_ClONE_FOLDER
	echo "> Instaling LibRetro"
	echo "> Cloning LibRetro"

	rm -rf $RA_CLONE_DIR
	git clone -C / $RA_REPO_URL $RA_CLONE_DIR

	cd $RA_CLONE_DIR
	./configure
	if [ $? -ne 0 ]; then
		echo "Error configuring Retroarch"
		return 1
	fi 

	make clean && make -j4
	if [ $? -ne 0 ]; then
		echo "Error building Retroarch"
		return 1
	fi 

	cd $RA_CLONE_DIR && chmod +x ./retroarch && sudo cp -rfv ./retroarch /usr/local/bin/retroarch
	rm -rf $RA_CLONE_DIR

	echo "> Retroarch done"
}