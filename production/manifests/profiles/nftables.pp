class profiles::nftables (
  Array $ip = '127.0.0.1',
) {
  $nftables_outbound_defaults = {
    'default_out-puppet' => {
      content => "ip daddr ${ip} tcp dport 8140 accept",
    },
    'default_out-httphttps' => {
      content => "ip daddr ${ip} tcp dport { 80, 443 } accept",
    },
    'default_out-ntp' => {
      content => "ip daddr ${ip} udp dport 123 accept",
    },
    'default_out-dnsudp' => {
      content => "ip daddr ${ip} udp dport 53 accept",
    },
    'default_out-dnstcp' => {
      content => "ip daddr ${ip} tcp dport 53 accept",
    },
  }

  $nftables_inbound_defaults = {}

  $nftables_rules_real = $nftables_inbound_defaults + $nftables_outbound_defaults

  # $nftables_rules_real = $nftables_inbound_defaults + $nftables_rules_inbound + $nftables_outbound_defaults + $nftables_rules_outbound

  class {'::nftables':
    in_ssh           => false,
    in_icmp          => false,
    out_dns          => false,
    out_http         => false,
    out_https        => false,
    out_icmp         => false,
    out_ntp          => false,
    rules            => $nftables_rules_real,
    firewalld_enable => false,
  }

}




