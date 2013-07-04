# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :centos do |config|
    config.vm.box = "centos-64"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  end

  config.vm.define :ubuntu do |config|
    config.vm.box = "ubuntu1204"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  end

  # https://wiki.freebsd.org/pkgng#Availability_of_pkgs_for_Download
  config.vm.define :freebsd do |config|
    config.vm.box = "freebsd91"
    config.vm.box_url = "https://s3.amazonaws.com/vagrant_boxen/freebsd_amd64_ufs.box"
    config.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"
    config.vm.network :private_network, ip: "192.168.55.6"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    end
  end

  config.vm.provision :shell,
    :inline => 'mkdir -p /var/lib/puppet && puppet apply --modulepath=/vagrant/modules /vagrant/manifests/site.pp'
end
