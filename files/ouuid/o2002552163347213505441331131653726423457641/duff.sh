#!/bin/bash

showHelpAndExit() {

echo 1>&2 'SYNOPSIS

duff INFIX [ PATHNAMES ] [ --verbose ]

DESCRIPTION

Search the trees specified by PATHMANES for
files with infixes matching INFIX.'

exit

}

test $# -ge 1 || showHelpAndExit

# THIS duff-S CLI NAME
C=o2002552163347213505441331131653726423457641

# THIS duff-S PACKAGE NAME
V=o2615574722363437501075354070230130144766223

# USER PROFILE DIRECTORY FOR THE CLI
Q=~/.$C

# USER PROFILE DIRECTORY FOR THIS duff
P=~/.$V

# FIND OUT WHERE THE CLI IS INSTALLED
read J < $Q/INSTALL

# FIND OUT WHERE THIS duff IS INSTALLED
read I < $P/INSTALL

R   --quiet --vanilla --no-echo   -f "$J/$C/duffCLI.R"   --args "$V" $@
