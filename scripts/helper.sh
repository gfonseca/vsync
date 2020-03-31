#!/bin/bash

prepare_dir(){
    DIR=$1
    rm -rf $DIR &&\ 
    mk -p $DIR &&\ 
    cd $DIR

    return $?
}