class mcollective::server::config {
 concat { '/etc/mcollective/server.cfg':
   owner   => 'root',
   group   => 'root',
 }

 concat::fragment { 'mcollective_server_header':
   order   => '00',
   target  => '/etc/mcollective/server.cfg',
   content => template('mcollective/server.cfg.erb'),
 }
}
