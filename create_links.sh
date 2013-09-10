#!/bin/bash

# This script will create symlinks to fasten PXE load.

function ln_boot() {
    ln -s boot/isolinux/$1 ./$1
}

# create root links to .c32 files.
ln_boot ldlinux.c32
ln_boot libcom32.c32
ln_boot libutil.c32