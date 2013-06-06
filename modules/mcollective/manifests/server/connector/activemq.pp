class mcollective::server::connector::activemq(
  $activemq_servers = ['localhost'],
  $activemq_mcollective_password = 'marionette',
)
{
  mcollective::server::config::fragment { 'connector':
    content => template('mcollective/activemq.cfg.erb'),
  }
}
