#!/bin/sh

SCRIPT="duplicate_here.py"
DIR="$(dirname "$(realpath "$0")")"

$DIR/$SCRIPT "$1"