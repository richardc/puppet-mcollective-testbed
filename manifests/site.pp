class { 'puppetlabs_repos': } -> Package <| |>

if $::osfamily == 'RedHat' {
  package { 'hiera':
    ensure => 'latest',
  }
}

# a use of import - I am a professional stunt man
import "/vagrant/modules/mcollective/spec/fixtures/manifests/end_to_end.pp"
