define mod_fastcgid::starter(
  $owner,
  $group,
  $type,
  $fcgi_max_requests = 5000,
  $fcgi_children = 8
){
  require ::mod_fastcgid

  file{"/var/www/mod_fcgid-starters/${name}":
    content => template("mod_fcgid/${type}_starter.erb"),
    owner => $owner, group => $group, mode => 0700;
  }
}