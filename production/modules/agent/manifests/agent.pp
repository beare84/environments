class agent {
  file { '/opt/script.sh':
    owner => 'root',
    group => 'root',
    mode => '0700',
    source => 'puppet:///modules/agent/agent.sh',
  }
}
