define mod_fcgid::starter(
  $owner,
  $group,
  $cgi_type,
  $cgi_type_options = {},
  $fcgi_max_requests = 5000,
  $fcgi_children = 8
){
  require ::mod_fcgid

  file{
    "/var/www/mod_fcgid-starters/${name}":
      ensure => directory,
      owner => $owner, group => $group, mode => 0700;
    "/var/www/mod_fcgid-starters/${name}/${name}-starter":
      content => template("mod_fcgid/${cgi_type}_starter.erb"),
      owner => $owner, group => $group, mode => 0700;
  }
}