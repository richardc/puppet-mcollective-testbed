class mcollective::server (
  $factsource = 'yaml',
  $connector  = 'activemq',
  $securityprovider = 'psk',
) {
  anchor { 'mcollective::server::begin': } ->
  class { 'mcollective::server::install': } ->
  class { 'mcollective::server::config': } ~>
  class { 'mcollective::server::service': } ->
  anchor { 'mcollective::server::end': }

  class { "mcollective::server::factsource::${factsource}": }
  class { "mcollective::server::connector::${connector}": }
  class { "mcollective::server::securityprovider::${securityprovider}": }
}
