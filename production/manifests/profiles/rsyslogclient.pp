class profiles::rsyslogclient (
) {
# Configure the rsyslog client to log to our rsyslog server
  class { 'rsyslog::client':
    log_remote                => true,
    spool_size                => '1g',
    spool_timeoutenqueue      => false,
    remote_type               => 'tcp',
    remote_forward_format     => 'RSYSLOG_ForwardFormat',
    log_local                 => false,
    log_local_custom          => undef,
    log_auth_local            => false,
    listen_localhost          => false,
    split_config              => false,
    custom_config             => undef,
    custom_params             => undef,
    server                    => '139.180.164.58',
    port                      => '514',
    remote_servers            => false,
    ssl_ca                    => undef,
    ssl_permitted_peer        => undef,
    ssl_auth_mode             => 'anon',
    log_templates             => false,
    log_filters               => false,
    actionfiletemplate        => false,
    high_precision_timestamps => false,
    rate_limit_burst          => undef,
    rate_limit_interval       => undef,
    imfiles                   => undef
  }

# Forward these particular logs  to the rsyslog server (Debian workstations only)
# On Debian the group owner appears to be syslog
  if $facts['os']['family'] == 'Debian' {
    file { '/etc/rsyslog.d/60-etc.conf':
      ensure  => 'file',
      group   => 'syslog',
      owner   => 'root',
      mode    => '0644',
      content => "module(load=\"imfile\" PollingInterval=\"10\")\ninput(type=\"imfile\" File=\"/home/bmon/Downloads/claymore15.0/*_log.txt\" Tag=\"etc-mining\" Severity=\"info\")"
    }
  }

# Forward a log containing all puppet agent runs to the rsyslog server (for the puppetserver only)
# On CentOS the group owner appears to be root
  if $facts['hostname'] == 'puppetserver' {
    file { '/etc/rsyslog.d/60-puppetserver.conf':
      ensure  => 'file',
      group   => 'root',
      owner   => 'root',
      mode    => '0644',
      content => "module(load=\"imfile\" PollingInterval=\"10\")\ninput(type=\"imfile\" File=\"/var/log/puppetlabs/puppetserver/puppetserver.log\" Tag=\"puppet-runs\" Severity=\"info\")"
    }
  }

}
