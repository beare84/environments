node 'default' {
  include profiles::linuxbase
  include profiles::rsyslogclient
}

node 'puppetserver' {
  include profiles::linuxbase
  include profiles::rsyslogclient
  include profiles::puppetserver
}

node 'puppetagent01' {
  include profiles::linuxbase
  include profiles::rsyslogclient
  include profiles::rsyslogserver
}

node 'puppetserver.openstacklocal' {
  include profiles::linuxbase
  include profiles::rsyslogclient
  include profiles::puppetserver
}
node 'splunkenterprise.openstacklocal' {
  include profiles::linuxbase
  include profiles::rsyslogclient
  include profiles::rsyslogserver
  include profiles::splunkenterprise
}
node 'tozza' {
  include profiles::rsyslogclient
}
node 'winagent0.openstacklocal' {
  include profiles::winbase
}
