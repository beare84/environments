class profiles::puppetserver (
) {
  firewalld_rich_rule { 'Accept Puppet':
    ensure => present,
    zone   => 'public',
    source => '0.0.0.0/0',
    port   => {
      'port'     => 8140,
      'protocol' => 'tcp',
    },
    action => 'accept',
  }

  service { 'puppetserver':
    ensure => 'running',
    enable => true,
  }
}
