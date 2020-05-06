class profiles::puppetserver (
) {
  firewalld_rich_rule { 'Accept Puppet':
    ensure => present,
    zone   => 'public',
    source => '192.168.102.0/24',
    port   => {
      'port'     => 8140,
      'protocol' => 'tcp',
    },
    action  => 'accept',
  }
  service { puppetserver:
    ensure  => 'running',
    enable  => true,
  }
}
