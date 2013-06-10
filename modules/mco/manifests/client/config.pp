class mcollective::client::config {
  concat { '/etc/mcollective/client.cfg':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }

  concat::fragment { 'mcollective_client_header':
    target  => '/etc/mcollective/client.cfg',
    content => template('mcollective/client.cfg.erb'),
    order   => '00',
  }
}
