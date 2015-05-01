# -*- mode: ruby -*-
# vi: set ft=ruby :

# Working version

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty32'

  config.vm.network :forwarded_port, guest: 3000, host: 3000  # rails server
  config.vm.network :forwarded_port, guest: 5432, host: 15432 # postgres
  config.vm.network :forwarded_port, guest: 4200, host: 4200  # ember server

  # Setup the synched project folder. Permissions have to be set here.
  # http://jeremykendall.net/2013/08/09/vagrant-synced-folders-permissions/
  host_fldr =  'C:/Users/loco/My Projects'
  guest_fldr = '/home/vagrant/projects'

  # https://www.virtualbox.org/ticket/10085
  # https://github.com/npm/npm/issues/7308 @drmyersii
  # See Vagrantfile_notes.txt for details & Win7 requirements to make this work
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata",
                 :id,
                 "VBoxInternal2/SharedFoldersEnableSymlinksCreate/guest_fldr",
                 "1"]
  end

  config.vm.synced_folder host_fldr, guest_fldr,
                          create: true,
                          mount_options: ["dmode=775,fmode=664"]

  # -- base setup --
  config.vm.provision :shell, path: 'setup/setup_base_root.sh'

  # -- unprivileged setup --
  config.vm.provision :shell, path: 'setup/setup_base_user.sh', privileged: false

  # -- setup project --
  config.vm.provision :shell, path: 'setup/setup_project.sh', privileged: false
end
