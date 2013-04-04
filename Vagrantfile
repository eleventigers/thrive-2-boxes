# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :api do |api|
    api.vm.box = "precise64"
    api.vm.box_url = "http://files.vagrantup.com/precise64.box"
    api.vm.hostname = "thrive2api"
    api.vm.provision :shell, :path => "bootstrap.sh"
    api.vm.network :forwarded_port, guest: 80, host: 8080
    api.vm.network :private_network, ip: "192.168.50.2"
    api.vm.synced_folder "../thrive-2-api", "/home/vagrant/thrive-2-api"
    api.vm.provision :chef_solo do |chef|
      chef.add_recipe "openssl"
      chef.add_recipe "postgresql::server"
      chef.add_recipe "postgresql::libpq"
      chef.json = {
        :postgresql => {
          :version  => "9.1",
          :listen_addresses => "*",
          :pg_hba => [
            "host all all 0.0.0.0/0 md5",
            "host all all ::1/0 md5",
          ],
          :users => [
            { :username => "postgres", :password => "password",
              :superuser => true, :login => true, :createdb => true }
          ],
        }
      }
    end
  end

  config.vm.define :front do |front|
    front.vm.box = "precise32"
    front.vm.box_url = "http://files.vagrantup.com/precise32.box"
    front.vm.hostname = "thrive2front"
    front.vm.provision :shell, :path => "bootstrap-front.sh"
    front.vm.network :forwarded_port, guest: 3000, host: 3000
    front.vm.network :private_network, ip: "192.168.50.3"
    front.vm.synced_folder "../thrive-2-front", "/home/vagrant/thrive-2-front"
    front.vm.provision :chef_solo do |chef|
      chef.add_recipe "nodejs"
      chef.add_recipe "redis-server" 
      chef.json = {
        "nodejs" => {
          "version" => "0.10.0"
          # "from_source" => true
        }
      }
    end
  end

end

