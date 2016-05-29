# define a mod_fcgid starter
define mod_fcgid::starter(
  $owner,
  $group,
  $cgi_type,
  $cgi_type_options   = {},
  $fcgi_max_requests  = 5000,
  $tmp_dir            = false,
  $binary             = undef,
  $additional_cmds    = undef,
  $rc                 = undef,
){
  require ::mod_fcgid

  file{
    "/var/www/mod_fcgid-starters/${name}":
      ensure  => directory,
      force   => true,
      purge   => true,
      recurse => true,
      owner   => $owner,
      group   => $group,
      mode    => '0644';
    "/var/www/mod_fcgid-starters/${name}/${name}-starter":
      content => template("mod_fcgid/${cgi_type}_starter.erb"),
      owner   => $owner,
      group   => $group,
      mode    => '0700';
  }
  if str2bool($::selinux) {
    File["/var/www/mod_fcgid-starters/${name}","/var/www/mod_fcgid-starters/${name}/${name}-starter"]{
      seltype => httpd_sys_script_exec_t,
    }
  }
}
