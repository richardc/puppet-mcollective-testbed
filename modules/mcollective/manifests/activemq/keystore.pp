class mcollective::activemq::keystore {
  java_ks { 'puppetca:truststore':
    ensure       => 'latest',
    certificate  => '/var/lib/puppet/ssl/certs/ca.pem',
    target       => '/etc/activemq/broker.ts',
    password     => 'puppet',
    trustcacerts => true,
  } ->

  file { '/etc/activemq/broker.ts':
    owner => 'activemq',
    group => 'activemq',
    mode  => '0600',
  }

  java_ks { 'puppetca:keystore':
    ensure       => 'latest',
    certificate  => "${::settings::ssldir}/certs/${::clientcert}.pem",
    private_key  => "${::settings::ssldir}/private_keys/${::clientcert}.pem",
    target       => '/etc/activemq/broker.ks',
    password     => 'puppet',
    trustcacerts => true,
  } ->

  file { '/etc/activemq/broker.ks':
    owner => 'activemq',
    group => 'activemq',
    mode  => '0600',
  }
}
