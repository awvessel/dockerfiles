# -*- mode: ruby -*-
# # vi: set ft=ruby :

CLOUD_CONFIG_PATH = "./cloud-config.yml"

Vagrant.configure("2") do |config|

  config.vm.box = "coreos-beta"
  config.vm.hostname = "buildvm"
  config.vm.network :private_network, ip: "192.168.60.101"

  # Provider specific configuration
  config.vm.provider :virtualbox do |virtualbox, override|
    override.vm.box_url = "http://storage.core-os.net/coreos/amd64-usr/beta/coreos_production_vagrant.json"
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    virtualbox.memory = 2048
    virtualbox.cpus = 2
  end

  config.vm.provider :vmware_fusion do |vmware_fusion, override|
    override.vm.box_url = "http://storage.core-os.net/coreos/amd64-usr/beta/coreos_production_vagrant_vmware_fusion.json"
    vmware_fusion.vmx["memsize"] = 2048
    vmware_fusion.vmx["numvcpus"] = 2
  end

  # Plugin conflict resolution
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  # NFS shares
  config.vm.synced_folder "scripts", "/home/core/bin",
                          id: "scripts",
                          :nfs => true,
                          :mount_options => ['nolock,vers=3,udp']

  config.vm.synced_folder "src", "/mnt/dockerfiles",
                          id: "dockerfiles",
                          :nfs => true,
                          :mount_options => ['nolock,vers=3,udp']

  # CoreOS startup
  config.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
  config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true

end
