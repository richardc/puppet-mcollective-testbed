class mcollective::server::service {
  service { 'mcollective':
    ensure => 'running',
    enable => true,
  }
}
