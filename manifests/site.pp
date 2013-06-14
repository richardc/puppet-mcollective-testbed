class { 'puppetlabs_repos': } -> 
class { 'mcollective':
  activemq_hosts => [ 'localhost'],
}
class { 'mcollective::middleware::activemq': } ->
class { 'mcollective::server': }

class { 'mcollective::client': } <- Class['puppetlabs_repos']
