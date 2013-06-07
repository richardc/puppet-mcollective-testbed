define mco::configfile($data = {}) {
  file { $title:
    content => template('that_renders_data'),
  }
}

class mco::client {
  mco::configfile { '/etc/mcollective/client.cfg':
    data => {
    },
  }
}

# Usage


class { 'mco::client':
  $connector = 'activemq',
}
