#!/bin/bash


install_retroarch(){
	RA_REPO_URL=$1
	RA_CLONE_DIR=$2

	echo -e "\n> Instaling LibRetro"
	echo "> Cloning LibRetro"

	rm -rf $RA_CLONE_DIR
	mkdir -p $RA_CLONE_DIR
	git -C / clone $RA_REPO_URL $RA_CLONE_DIR
	if [ $? -ne 0 ]; then
		echo "Error cloning Retroarch"
		return 1
	fi 

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

	chmod +x ./retroarch && cp -rfv ./retroarch /usr/local/bin/retroarch
	rm -rf $RA_CLONE_DIR

	echo "> Retroarch done"
}