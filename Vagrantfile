# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :centos do |config|
    config.vm.box = "centos-64"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  end


  config.vm.define :ubuntu do |config|
    config.vm.box = "ubuntu1204"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = [ "modules", "modules/mcollective/spec/fixtures/modules" ]
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end

end
