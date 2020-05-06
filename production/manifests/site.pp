node 'default' {
  include profiles::linuxbase
  include profiles::rsyslogclient
}
node 'puppetserver.openstacklocal' {
  include profiles::linuxbase
  include profiles::rsyslogserver
  include profiles::rsyslogclient
  include profiles::puppetserver
  include profiles::splunkforwarder
}
node 'splunkenterprise.openstacklocal' {
  include profiles::linuxbase
  include profiles::rsyslogclient
  include profiles::splunkenterprise
}
node 'winagent0.openstacklocal' {
  include profiles::winbase
}
