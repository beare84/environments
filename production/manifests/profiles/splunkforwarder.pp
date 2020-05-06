class profiles::splunkforwarder (
  String $my_splunk_server = lookup('profiles::splunkforwarder::my_splunk_server'),
) {

  # I eventually decided to not use the forwarder
  # The splunk enterprise server is also the syslog server
  # so it can access the logs directly from disk

  class { '::splunk::params':
      server => $my_splunk_server,
  }

  @splunkforwarder_input { 'puppetserver-sourcetype':
    section => 'monitor:///var/log/puppetlabs/puppetserver/puppetserver.log',
    setting => 'sourcetype',
    value   => 'puppetserver',
    tag     => 'splunk_forwarder'
  }

  include ::splunk::forwarder

}
