# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "mitchellh/boot2docker"
  config.vbguest.auto_update = false
  config.vm.network "forwarded_port", guest: 8080, host: 8080
end
