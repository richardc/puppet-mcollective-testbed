class { 'puppetlabs_repos': } -> 
class { 'mcollective::activemq': } ->
class { 'mcollective::server': }

class { 'mcollective::client': } <- Class['puppetlabs_repos']
