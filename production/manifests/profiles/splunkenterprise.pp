class profiles::splunkenterprise (
) {

  # The below code changes the admin user's password to 'password'
  # I generated this hash on a splunk enterprise server using:
  # /opt/splunk/bin/splunk hash-passwd password
  class { 'splunk::enterprise':
    seed_password    => true,
    password_hash    => '$6$j1WsvQLba1oOJDuH$o0/.8FojcdF8Sth2npfhRziIlhRjxmYii/5IP.61jCK9rOLos322Rs7GOI3cNXP7DlgyYwmZq8P1r1ll4OQmU.',
  }

  firewalld_rich_rule { 'Accept Splunk Enterprise Web UI':
    ensure => present,
    zone   => 'public',
    source => '192.168.1.0/24',
    port   => {
      'port'     => 8000,
      'protocol' => 'tcp',
    },
    action => 'accept',
  }

  firewalld_rich_rule { 'Accept Splunk Enterprise Deployment Clients':
    ensure => present,
    zone   => 'public',
    source => '192.168.1.0/24',
    port   => {
      'port'     => 8000,
      'protocol' => 'tcp',
    },
    action => 'accept',
  }

  firewalld_rich_rule { 'Accept Splunk Enterprise Forwarders':
    ensure => present,
    zone   => 'public',
    source => '192.168.1.0/24',
    port   => {
      'port'     => 8000,
      'protocol' => 'tcp',
    },
    action => 'accept',
  }

}
