# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::service
class apache::service {

  # schedule { 'everyday':
  #   period => 'daily',
  #   range => "1-6",
  # }

  service { "${apache::service_name}":
    ensure     => $apache::service_ensure
    ensure     => $apache::service_enable
    hasrestart => true,
    # subscribe  => File['apache_config'],
    # schedule => 'everyday',
  }

}
