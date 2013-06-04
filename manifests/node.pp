class { 'puppetlabs_repos': } -> 
class { 'mcollective::activemq': } ->
class { 'mcollective::server': }
