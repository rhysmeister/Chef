Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # Add 8GB RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--name", "Chef",
      "--memory", "8192"
    ]
  end

  config.vm.hostname = "Chef"
  config.vm.network "private_network", ip: "192.168.4.145"
  
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "chef.yaml"
  end

end
