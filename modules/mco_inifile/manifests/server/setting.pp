define mco_inifile::server::setting(
  $value,
)
{
  ini_setting { "server_${name}":
    ensure  => present,
    path    => '/etc/mcollective/server.cfg',
    section => '',
    setting => $name,
    value   => $value,
  }
}
