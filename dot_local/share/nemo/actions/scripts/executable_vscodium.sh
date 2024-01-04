#!/bin/bash

if [ -d "$1" ]; then
    cd "$1" && vscodium .
elif [ -f "$1" ]; then
    vscodium "$1"
fi 
