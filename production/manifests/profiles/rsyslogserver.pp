class profiles::rsyslogserver (
) {
  # Note, you will need to run the below otherwise rsyslog will fail to run.
  # This is due to selinux being in enforcing mode (as it should)
  # When you make /srv/log it wont have the right context for rsyslog to write to.
  # mkdir /srv/log
  # chcon --reference /var/log /srv/log

  class { 'rsyslog::server':
    enable_tcp                => true,
    enable_udp                => false,
    enable_relp               => false,
    enable_onefile            => false,
    relay_server              => false,
    server_dir                => '/srv/log/',
    custom_config             => undef,
    content                   => undef,
    port                      => '514',
    relp_port                 => '20514',
    address                   => '*',
    high_precision_timestamps => false,
    ssl_ca                    => undef,
    ssl_cert                  => undef,
    ssl_key                   => undef,
    log_templates             => false,
    log_filters               => false,
    actionfiletemplate        => false,
    rotate                    => undef
  }
  firewalld_rich_rule { 'Accept Rsyslog':
    ensure => present,
    zone   => 'public',
    source => '0.0.0.0/0',
    port   => {
      'port'     => 514,
      'protocol' => 'tcp',
    },
    action => 'accept',
  }
}
