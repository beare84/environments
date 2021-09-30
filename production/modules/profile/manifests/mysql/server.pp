# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::mysql::server
class profile::mysql::server {
  class { '::mysql::server':
    root_password           => 'passwordhash',
    remove_default_accounts => true,
  }
}
