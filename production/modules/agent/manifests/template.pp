class agent::template {
  template { 'motd':
    path => '/etc/motd',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/agent/motd.erb'
  }
}
