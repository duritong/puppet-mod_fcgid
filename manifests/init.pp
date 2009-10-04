# modules/mod_fcgid/manifests/init.pp - manage mod_fcgid stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class mod_fcgid {
    case $operatingsystem {
        default: { include mod_fcgid::base }
    }
}
