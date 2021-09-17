node default {
    file { '/etc/motd':
      owner => 'root',
      group => 'root',
      mode => '0644',
      content => "\nAll Hail the Knife Crab",
    }

    file { '/opt/script.sh':
      owner => 'root',
      group => 'root',
      mode => '0700',
      content => "password='amazing'\necho -e \"custom_attributes:\n  challengePassword: \\"$password\\"\" > /etc/puppetlabs/puppet/csr_attributes.yaml",
    }

}
