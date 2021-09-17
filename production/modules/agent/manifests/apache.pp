class agent::apache {
  if $osfamily == 'redhat' {
    package { 'httpd':
      ensure => 'latest',
    }
  }
  elsif $osfamily == 'debian' {
    package { 'apache2':
      ensure => 'latest',
    }
  }
}
