# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "balanced-php-vm-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode-ubuntu-12.04"

  # The url from where the 'config.vm.box' box will be fetched if it doesn't already exist on the user's system.
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"


  config.omnibus.chef_version = :latest

  # Assign this VM to a host-only network IP, allowing you to access it
  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true


  config.vm.provision :chef_solo do |chef|

    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[balanced-php-vm::default]"
    ]

  end
end
