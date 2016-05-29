# setup all the things we
# need for mod_fcgid
class mod_fcgid::base {
  package {
    'mod_fcgid' :
      ensure  => installed,
      require => Package['apache'],
  }
  file {
    '/var/www/mod_fcgid-starters' :
      ensure  => directory,
      force   => true,
      purge   => true,
      recurse => true,
      require => Package[apache],
      owner   => root,
      group   => 0,
      mode    => '0644';
  }
  if $::selinux == 'true' {
    if $::lsbmajdistrelease == '5' {
      package {
        'mod_fcgid-selinux' :
          ensure  => present,
          require => Package['mod_fcgid'],
      }
    }
    selinux::fcontext {
      '/var/www/mod_fcgid-starters/.+(/.*)?' :
        setype => 'httpd_sys_script_exec_t',
        before => File['/var/www/mod_fcgid-starters'] ;
    }
  }
}
