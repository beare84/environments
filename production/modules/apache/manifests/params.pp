# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::params
class apache::params {
  $install_ensure = 'present'
  if $::osfamily {
    'Redhat': {
      $install_name = 'httpd'
    }
  }
  elsif $::osfamily {
    'Debian': {
      $install_name = 'apache2'
    }
  }
}
