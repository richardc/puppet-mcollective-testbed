class puppetlabs_repos {
  if $::osfamily == 'RedHat' {
    yumrepo { 'puppetlabs-devel':
        baseurl  => 'http://yum.puppetlabs.com/el/6/devel/$basearch',
        descr    => 'Puppet Labs Devel El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'puppetlabs-deps':
        baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
        descr    => 'Puppet Labs Dependencies El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'puppetlabs-products':
        baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
        descr    => 'Puppet Labs Products El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'epel':
        descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
        enabled        => '1',
        failovermethod => 'priority',
        gpgcheck       => '0',
        mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    }
  }

  if $::osfamily == 'Debian' {
    file { '/etc/apt/sources.list.d/puppetlabs.list':
      content => "deb http://apt.puppetlabs.com precise main dependencies\n",
    } ~>
    exec { '/usr/sbin/apt-get update':
      refreshonly => true,
    }
  }
}
