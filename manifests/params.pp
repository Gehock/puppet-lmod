# == Class: lmod::params
#
# The lmod configuration settings.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class lmod::params {

  case $::osfamily {
    'RedHat': {
      $base_packages = [
        'lua-filesystem',
        'lua-json',
        'lua-posix',
        'lua-term',
        'zsh',
      ]
      $runtime_packages = [
        'lua',
      ]
      $build_packages = suffix($runtime_packages, '-devel')
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
