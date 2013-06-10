class mcollective::client (
  $connector = 'activemq'
) {
  anchor { 'mcollective::client::begin': } ->
  class { 'mcollective::client::install': } ->
  class { 'mcollective::client::config': } ->
  anchor { 'mcollective::client::end': }

  class { "mcollective::client::connector::${connector}": }
}
