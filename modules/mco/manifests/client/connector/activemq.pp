class mcollective::client::connector::activemq  (
  $activemq_servers = ['localhost'],
  $activemq_mcollective_password = 'marionette',
)
{
  mcollective::client::config::fragment { 'connector':
    content => template('mcollective/activemq.cfg.erb'),
  }
}
