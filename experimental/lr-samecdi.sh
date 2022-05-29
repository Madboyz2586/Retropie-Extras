#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-samecdi"
rp_module_desc="lr-mess fork that officaly for Philips CD-I"
rp_module_help="ROM Extensions: .chd .iso\nCopy your Philips CD-I roms to $romdir/cdi"
rp_module_licence="GPL 2 https://raw.githubusercontent.com/libretro/same_cdi/master/COPYING"
rp_module_repo="git https://github.com/libretro/same_cdi.git master"
rp_module_section="exp"

function sources_lr-samecdi() {
    gitPullOrClone
}

function build_lr-samecdi() {
    make -f Makefile.libretro
    md_ret_require="$md_build/same_cdi_libretro.so"
}

function install_lr-gearsystem() {
    md_ret_files=(
        'same_cdi_libretro.so'
        'LICENSE'
        'README.md'
    )
}

function configure_lr-samecdi() {
    local system
	mkRomDir "cdi"
        defaultRAConfig "cdi"
        addEmulator 0 "$md_id" "cdi" "$md_inst/same_cdi_libretro.so"
        addSystem "cdi"
    done
}
