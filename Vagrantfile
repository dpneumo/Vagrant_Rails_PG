# -*- mode: ruby -*-
# vi: set ft=ruby :

# Working version

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty32'

  config.vm.network :forwarded_port, guest: 3000, host: 3000  # rails server
  config.vm.network :forwarded_port, guest: 5432, host: 15432 # postgres
  config.vm.network :forwarded_port, guest: 4200, host: 4200  # ember server

  #config.vm.synced_folder 'postgres_bootstrap', '/mnt/bootstrap', '.', :create => true

  # -- base setup --
  config.vm.provision :shell, path: 'setup/base_setup.sh'

  # -- unprivileged setup --
  config.vm.provision :shell, path: 'setup/unprivileged_setup.sh', privileged: false
end
