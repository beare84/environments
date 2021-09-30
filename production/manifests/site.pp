node puppetenterpriseagent {
  include apache

  apache::vhost { 'puppet_project':
    port      => 80,
    subdomain => 'puppetproject',
    admin     => 'admin@mylabserver.com',
    docroot   => '/var/www/html/puppetproject',
  }

node puppetenterprisemaster {
  
}
  # include ntp
  # Class { 'ntp': 

  # }
    
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
  # include blah

}
