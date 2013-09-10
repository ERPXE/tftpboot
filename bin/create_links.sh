#!/bin/bash

# This script will create symlinks to fasten PXE load.

cd ..

function ln_boot() {
    ln -s boot/isolinux/$1 ./$1
}

function ln_pxe() {
    ln -s default ./$1
}

# create root links to .c32 files.
ln_boot ldlinux.c32
ln_boot libcom32.c32
ln_boot libutil.c32

# create common subnets loaders in pxelinux.cfg
cd pxelinux.cfg
ln_pxe 0A
ln_pxe 0A0
ln_pxe 0A00
ln_pxe 0A000
ln_pxe 0A0000
ln_pxe C0
ln_pxe C0A
ln_pxe C0A8
ln_pxe C0A80
ln_pxe C0A800