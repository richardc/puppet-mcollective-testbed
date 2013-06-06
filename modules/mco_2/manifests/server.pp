class mco_2::server {
  $parameters = get_scope_args()
  $defaults = {
    connector => 'activemq',
  }

  $config = merge( $defaults, $parameters )
  mco_2::configfile { '/etc/mcollective/server.cfg':
    data => $config,
  }
}
