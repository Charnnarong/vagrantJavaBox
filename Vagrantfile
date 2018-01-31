# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w(vagrant-vbguest)
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "node-master" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "node-master"
    d.vm.network "private_network" , ip: "10.100.198.10"
    d.vm.synced_folder ".", "/vagrant", disabled: true
    d.vm.provision :shell, path: "scripts/passwordAuthentication.sh"
    d.vm.provision :shell, path: "scripts/provision.sh"
    d.vm.provision :shell, path: "scripts/setJavaHome.sh"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  
    config.vm.define "node1" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "node1"
    d.vm.network "private_network" , ip: "10.100.198.20"
    d.vm.synced_folder ".", "/vagrant", disabled: true
    d.vm.provision :shell, path: "scripts/passwordAuthentication.sh"
    d.vm.provision :shell, path: "scripts/provision.sh"
    d.vm.provision :shell, path: "scripts/setJavaHome.sh"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  
    config.vm.define "node2" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "node2"
    d.vm.network "private_network" , ip: "10.100.198.30"
    d.vm.synced_folder ".", "/vagrant", disabled: true
    d.vm.provision :shell, path: "scripts/passwordAuthentication.sh"
    d.vm.provision :shell, path: "scripts/provision.sh"
    d.vm.provision :shell, path: "scripts/setJavaHome.sh"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end
end
