class mcollective::activemq::config {
  file { '/etc/activemq/activemq.xml':
    content => template('mcollective/activemq.xml.erb'),
  }
}
