# -*- mode: shell-script; -*-

# Copyright (C) 2017 Xavier Garrido
#
# Author: garrido@lal.in2p3.fr
# Keywords: functions
# Requirements:
# Status: not intended to be distributed yet

# Test on time consumption show no significant time change when using Makefile
# command
local_dir=$(dirname $0)
make -C ${local_dir} > /dev/null

source ${local_dir}/zsh-pkgtools.zsh
# end
