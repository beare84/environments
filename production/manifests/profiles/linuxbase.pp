class profiles::linuxbase (
  Array $apps     = ['nc', 'bind-utils', 'vim', 'chrony', 'openssh-server', 'yum-cron'],
  Array $services = ['sshd', 'chronyd', 'yum-cron'],
) {
# This profile does some standard config that I like to have on my linux hosts
# including enabling selinux, installing vim, yum-cron, opening sshd etc.
  package { $apps:
    ensure => 'installed',
  }
  service { $services:
    ensure  => 'running',
    enable  => true,
  }

  class { 'firewalld': }
  firewalld_rich_rule { 'Accept SSH':
    ensure => present,
    zone   => 'public',
    source => '192.168.1.0/24',
    service => 'ssh',
    action  => 'accept',
  }

  class { selinux:
    mode => 'enforcing',
    type => 'targeted',
  }
}
