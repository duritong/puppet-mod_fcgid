define mod_fcgid::starter(
  $owner,
  $group,
  $cgi_type,
  $fcgi_max_requests = 5000,
  $fcgi_children = 8
){
  require ::mod_fastcgid

  file{"/var/www/mod_fcgid-starters/${name}":
    content => template("mod_fcgid/${cgi_type}_starter.erb"),
    owner => $owner, group => $group, mode => 0700;
  }
}