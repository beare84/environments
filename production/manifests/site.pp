node default {
    # file { '/etc/motd':
    #   owner => 'root',
    #   group => 'root',
    #   mode => '0644',
    #   content => "\nAll Hail the Knife Crab",
    # }
  #class { 'agent': }
  #  if $osfamily == 'debian' {
  #    class { '::ntp': }
  #  }
  #}
  include blah

}
