class mod_fcgid::base {
    package{'mod_fcgid':
        ensure => installed,
    }

    file{"/etc/httpd/conf.d/fcgid.conf":
        source => [ "puppet://$server/files/mod_fcgid/${fqdn}/ssl.conf",
                    "puppet://$server/files/mod_fcgid/fcgid.conf",
                    "puppet://$server/modules/mod_fcgid/fcgid.conf"
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
