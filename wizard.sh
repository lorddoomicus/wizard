#!/bin/bash
#
# Shell functions that uses the wizard program to provide floating point 
# capabilities for the shell
#
# This should be sourced, ie: . ~/wizard.sh 
#
# 2016-12-05	DW2	Initial version
#

pi=$( echo pi | wizard )
e=$( echo e | wizard )

sqrt() {
	echo sqrt $1 | wizard
}

cbrt() {
	echo cbrt $1 | wizard
}
 
log() {
	echo log $1 | wizard
}

exp() {
	echo exp $1 | wizard
}
 
cos() {
	echo cos $1 | wizard
}

sin() {
	echo sin $1 | wizard
}

tan() {
	echo tan $1 | wizard
}
 
acos() {
	echo acos $1 | wizard
}

asin() {
	echo asin $1 | wizard
}

atan() {
	echo atan $1 | wizard
}
 
rad() {
	echo rad $1 | wizard
}

deg() {
	echo deg $1 | wizard
}

rnd() {
	echo rnd $1 | wizard
}
