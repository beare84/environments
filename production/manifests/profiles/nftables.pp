class profiles::nftables (
  String $puppet_server_ip  = '207.148.84.291',
  String $rsyslog_server_ip = '139.180.164.58',
  String $any_ip            = '0.0.0.0/0',
) {
  $nftables_inbound_defaults = {}

  # $nftables_rules_inbound = {}

  $nftables_rules_inbound = {
    'default_in-puppet' => {
      content => "ip saddr ${any_ip} tcp dport 8140 accept",
    },
  }

  # $nftables_outbound_defaults = {}
  $nftables_outbound_defaults = {
    'default_out-puppet' => {
      content => "ip daddr ${puppet_server_ip} tcp dport 8140 accept",
    },
    'default_out-rsyslog' => {
      content => "ip daddr ${rsyslog_server_ip} tcp dport 514 accept",
    },
  }

  $nftables_rules_outbound = {}

  $nftables_rules_real = $nftables_inbound_defaults + $nftables_rules_inbound + $nftables_outbound_defaults + $nftables_rules_outbound

  class {'::nftables':
    in_ssh           => false,
    in_icmp          => false,
    out_dns          => true,
    out_http         => true,
    out_https        => true,
    out_icmp         => false,
    out_ntp          => true,
    rules            => $nftables_rules_real,
    firewalld_enable => false,
  }

}
