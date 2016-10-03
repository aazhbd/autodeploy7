# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder "./data", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.name = "ArticulateLogic"
     vb.memory = "512"
  end
  config.vm.provision :shell, path: "./data/init.sh"
end
