# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.hostname = "cida-auth"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true

  config.vm.provider "virtualbox" do |v|
    v.name = "cida_auth"
    v.memory = 2048
  end

  config.vm.provider "vmware_fusion" do |v|
    v.name = "cida_auth"
  end

  # https://github.com/chef/vagrant-omnibus
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = :latest
  end

  # https://github.com/berkshelf/vagrant-berkshelf
  if Vagrant.has_plugin?("vagrant-berkshelf")
    config.berkshelf.enabled = true
  end

  # For test suites, can test using Postgres:
  # $ docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres:9.5.2

  config.vm.provision "chef_zero" do |chef|
    chef.node_name = "vagrant-cida-auth"
    chef.nodes_path = "./nodes"
    chef.environments_path = "./environments"
    chef.environment = "default"
    chef.data_bags_path = "./test/integration/default/data_bags"
    chef.encrypted_data_bag_secret_key_path  = "./test/integration/default/encrypted_data_bag_secret"
    chef.file_cache_path = "/tmp/vagrant-file-cache"
    chef.run_list = [
      "recipe[java]",
      "recipe[maven]",
      "recipe[cida-auth::database]",
      "recipe[cida-auth::appstack]"
    ]
  end

  # config.vm.provision "docker" do |d|
  #   d.run "postgres",
  #     image: "postgres:9.5.2",
  #     args: "--name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=test-pass"
  # end
end
