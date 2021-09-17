class agent {
  file { '/opt/script.sh':
    owner => 'root',
    group => 'root',
    mode => '0700',
    # content => 'blah'
    source => 'puppet:///modules/agent/agent.sh',
  }
}
