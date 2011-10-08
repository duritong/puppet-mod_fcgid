class mod_fcgid::base {
  package{'mod_fcgid':
    ensure => installed,
  }
  
  file{'/var/www/mod_fcgid-starters':
    ensure => directory,
    force => true,
    purge => true,
    recurse => true,
    owner => root, group => 0, mode => 0644;
  }
}
