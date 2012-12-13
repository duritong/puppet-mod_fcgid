# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# manage mod_fcgid installation
class mod_fcgid {
  case $::operatingsystem {
    default: { include mod_fcgid::base }
  }
}
