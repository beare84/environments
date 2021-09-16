class profiles::splunkenterprise (
) {
  # In the Splunk Web UI you can point Splunk to look for logs from a directory (Settings > Data Inputs > Files anmd Directories).
  # My Splunk Enterprise server is also my rsyslog server so it can get all client logs from /srv/log
  # You'll also need to activate the Free licence as Splunk comes installed with trial licence (Setting > Licening > Change Licence Group > Free Licence)
  # The Free license does not expire. The Free license allows you to index 500 MB per day

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

  # Not using forwarder currently
  # firewalld_rich_rule { 'Accept Splunk Enterprise Forwarders':
  #   ensure => present,
  #   zone   => 'public',
  #   source => '192.168.1.0/24',
  #   port   => {
  #     'port'     => 9997,
  #     'protocol' => 'tcp',
  #   },
  #   action => 'accept',
  # }

}
