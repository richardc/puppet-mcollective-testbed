class { 'puppetlabs_repos': } -> Class['mcollective']

# a use of import - I am a professional stunt man
import "/vagrant/modules/mcollective/spec/fixtures/manifests/end_to_end.pp"
