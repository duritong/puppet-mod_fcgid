# define a mod_fcgid starter
define mod_fcgid::starter(
  $owner,
  $group,
  $cgi_type,
  $cgi_type_options = {},
  $fcgi_max_requests = 5000
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
}
