install VirtualBox: https://www.virtualbox.org/wiki/Downloads

Install Vagrant: http://www.vagrantup.com/downloads.html

Create a project folder: eg "ember-crm" and cd into it

Copy the attached files into the project folder
  Vagrantfile goes directly into the project folder
  Create a "setup" folder
    Copy the sh files into "setup"

Within the project folder run this command at a command prompt:
  Vagrant up

  It takes ~ 2 min to have the base linux VM running

  Running the setup scripts adds ~ 30 min

When the setup is completed you will have:
  a running Ubuntu\trusty32 VM
  a linux development environment
  nodejs, ruby, rails and postgresql installed
  a running rails server with a minimal rails app backing it

On the host open a browser to http://localhost:3000

Back in the host command prompt you are in an ssh session on the VM
  shut down the rails server with <CTRL>-c
  leave the ssh session with 'exit'
  shut down the VM with "vagrant halt"

  you can restart with "vagrant up"
  The provisioning with the shell scripts will not be repeated.
  Caution: The scripts at this time are NOT idempotent.


Note:
1. This is a work in progress for me. There are many ways to
clean up the scripts. I wanted to have a functioning script set
before beginning to modify.

2. This mechanism can be used to setup any environment repeatedly
on the server of your choice. eg Python on a Centos box

3. This means you and others can be working on a project within
base environments.

4. The project folder is mirrored in the VM in the folder /vagrant.
cd to that folder on the VM and see the same directories and files as seen
in the project folder of the host machine. Thus you can do your editing
of a project on the host but run the project in the VM. For example
I use Sublime Text on my Windows laptop to edit the rails app I want to
run in a linux environment. When I am happy with the results I can deploy
to a real linux based server or to another VM setup for production.
This can be either in our offices or in the cloud.

5. My immediate purpose for this setup is to create an environment that
I can use to teach myself EmberJS. (http://emberjs.com/)

6. I have told git in .gitattributes that files matching *.sh are to be
cloned with LF End of Line markers. They are scripts that are to be
executed in a linux environment. This should solve an unpleasant problem
caused by the default git behavior that forced text files to have
Windows style EOL markers, CRLF. These would not execute correctly
in the linux vm.

7. Vagrant executes shell scripts by copying them to a temporary folder
on the VM. By default these execute with root privileges. The call to
"config.vm.provision :shell" must be qualified with ", privileged: false"
to run as the vagrant user. Environment variables set within the
"config.vm.provision" call are cleared when that command completes.
