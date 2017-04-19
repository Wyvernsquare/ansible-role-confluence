# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

# Checks ENV VAGRANT_DOTFILE_PATH. Set to current directory .vagrant if NULL
VAGRANT_DOTFILE_PATH = ENV['VAGRANT_DOTFILE_PATH'];
currpath = ENV['VAGRANT_DOTFILE_PATH'];
if(currpath.nil?)
    currpath = '.vagrant';
    ENV['VAGRANT_DOTFILE_PATH'] = currpath;
end
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Network Settings
  svradr = "172.31.16.100"
  netmsk = "255.255.255.0"
  # SSH User
  defusr = "vagrant"

  # VM variables
  VAGRANT_VM_PROVIDER = "virtualbox"
  ANSIBLE_RAW_SSH_ARGS = []
  ANSIBLE_RAW_SSH_ARGS << "-o IdentityFile=#{VAGRANT_VM_PROVIDER}/machines/server1/#{VAGRANT_VM_PROVIDER}/private_key"
  vmname = "server1"
  vhostname = "confluence"
  vboxdist = "centos/7"
  # Open hosts inventory file write pipe
  f = File.open("hosts","w")

  # Set up server
  config.vm.box = "#{vboxdist}"
  config.vm.define "#{vmname}"
  config.vm.network "private_network", ip: "#{svradr}", netmask: "#{netmsk}"
  config.vm.hostname = "#{vhostname}"

  f.puts "[#{vhostname}]"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
  f.puts "#{svradr} ansible_ssh_user=#{defusr} ansible_ssh_private_key_file=#{VAGRANT_VM_PROVIDER}/machines/#{vmname}/#{VAGRANT_VM_PROVIDER}/private_key" 
  
  # Close hosts inventory file write pipe
  f.close

  # Provision with Ansible
  config.vm.provision :ansible do |ansible|
    # Disable default limit to connect to machines
    ansible.limit = "all"
    ansible.playbook = "./tasks/main.yml"
    ansible.ask_vault_pass = true
    ansible.inventory_path = "hosts"
    #ansible.verbose = "-v"
    ansible.raw_ssh_args = ANSIBLE_RAW_SSH_ARGS
  end

  # Disable rsync
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
