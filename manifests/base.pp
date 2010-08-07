class mod_fcgid::base {
    package{'mod_fcgid':
        ensure => installed,
    }

    file{"/etc/httpd/conf.d/fcgid.conf":
        source => [ "puppet:///modules/site-mod_fcgid/${fqdn}/ssl.conf",
                    "puppet:///modules/site-mod_fcgid/fcgid.conf",
                    "puppet:///modules/mod_fcgid/fcgid.conf"
        ],
        owner => root, group => 0, mode => 0644;
    }
    file{"/etc/httpd/conf.d/php.conf":
        ensure => absent
    }
    file{"/etc/httpd/conf.d/perl.conf":
        ensure => absent
    }
}
