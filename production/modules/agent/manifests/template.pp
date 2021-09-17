class agent::template {
  file { 'motd':
    path => '/etc/motd',
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('puppet:///modules/agent/motd.erb'),
  }
}
