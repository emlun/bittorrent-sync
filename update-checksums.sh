#!/bin/bash
# Author: Emil Lundberg <lundberg.emil@gmail.com>
#
# This script runs 'makepkg -g' on a copy of PKGBUILD where all if/elif/else/fi
# statements have been removed, and then uses sed to replace the old checksums
# in PKGBUILD with the new ones.
#
# The script assumes that all checksums in the original PKGBUILD are strings of
# 32 or more hexadecimal characters ([0-9a-f], greedy), and that all such
# strings are checksums. 'SKIP' checksums are not updated.
#
# Note that since this script works by replacing checksum strings with new
# values, it only updates existing checksums. If a source file has no checksum
# specified, it will not be given one by this script.
#
# If the -c or --cleanup option is given, the script will remove the tmp
# directory used to store intermediate files such as the hacked PKGBUILD and
# the sed script. This directory is located under /tmp.

if [[ $0 == '/bin/bash' ]]; then
    echo "It looks like you're sourcing this script."
    echo "Please execute it directly instead, lest it clutter your shell with variables."
    return 1
fi

TMP_DIR="/tmp/$(basename $0)"
mkdir -p $TMP_DIR
TMP_PKGBUILD="$TMP_DIR/PKGBUILD.geninteg"
SED_SCRIPT_NAME="$TMP_DIR/$0.sed"
REMOVE_TMP_DIR=false
for arg in $@; do
    case $arg in
        -c|--cleanup)
            REMOVE_TMP_DIR=true
            ;;
    esac
done

export SRCDEST="${TMP_DIR}/src"
mkdir -p "$SRCDEST"

grep -vE "^[[:space:]]*(if|elif|else|fi)" PKGBUILD > $TMP_PKGBUILD

# Compute the new checksums
newsums=( )
for l in $(makepkg -g -p $TMP_PKGBUILD | grep -oE "[0-9a-f]{32,}"); do
    newsums+=("$l")
done

# Find the old checksums
oldsums=( )
for l in $(grep -oE "[0-9a-f]{32,}|SKIP" PKGBUILD); do
    oldsums+=("$l")
done

# Update the checksums in PKGBUILD
echo "Updating checksums..."
for i in ${!oldsums[@]}; do
    if [ "${oldsums[i]}" == 'SKIP' ]; then
        echo 'SKIP > SKIP'
    else
        echo "${oldsums[i]} > ${newsums[i]}"
        echo "s/${oldsums[i]}/${newsums[i]}/" >> $SED_SCRIPT_NAME
    fi
done

sed -i -f $SED_SCRIPT_NAME PKGBUILD

echo "Verifying correctness..."
makepkg --verifysource -f

if $REMOVE_TMP_DIR; then
    echo "Removing tmp dir $TMP_DIR"
    rm -r $TMP_DIR
else
    echo "Not removing tmp dir $TMP_DIR"
fi

# vim: ts=4:sw=4:et
