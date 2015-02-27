# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty32'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 5432, host: 15432 # postgres

  #config.vm.synced_folder 'postgres_bootstrap', '/mnt/bootstrap', '.', :create => true

  # -- base setup --
  config.vm.provision :shell, path: 'setup/base_setup.sh'

  # -- APPUSER as linux user --
  #config.vm.provision :shell, path: 'setup/app_user_as_linux_user.sh'

  # -- nodejs --
  #config.vm.provision :shell, path: 'setup/nodejs.sh'

  # -- postgres --
  #config.vm.provision :shell, path: 'setup/postgres_bootstrap.sh'

  # -- rbenv & ruby related --
  #config.vm.provision :shell, path: 'setup/rbenv.sh',            privileged: false
  #config.vm.provision :shell, path: 'setup/rbenv-first-ruby.sh', privileged: false

  # -- rails --
  #config.vm.provision :shell, path: 'setup/rails.sh',            privileged: false

  # -- rails app --
  #config.vm.provision :shell, path: 'setup/rails_app.sh',        privileged: false
end
