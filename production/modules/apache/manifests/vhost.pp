# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   apache::vhost { 'namevar': }
define apache::vhost (
  Integer   $port,
  String[1] $subdomain,
  String    $admin,
  String[1] $docroot,
) {
  file { "${docroot}":
    ensure => 'directory',
    owner  => $apache::vhosts_owner,
    group  => $apache::vhosts_group,
  }
  file { "${apache::vhosts_dir}/${subdomain}.conf":
    ensure  => 'file',
    owner   => $apache::vhosts_owner,
    group   => $apache::vhosts_group,
    mode    => '0644',
    content => epp('apache/vhost.conf.epp', {
      'port'      => $port,
      'subdomain' => $subdomain,
      'admin'     => $admin,
      'docroot'   => $docroot,
    }),
    notify  => Service['apache_service'],
  }
}
