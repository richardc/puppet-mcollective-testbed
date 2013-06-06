class mcollective::server::securityprovider::psk {
  mcollective::server::config::fragment { 'psk':
    content => "plugin.psk = unset\n",
  }
}
