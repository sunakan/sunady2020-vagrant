Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.synced_folder "./ansible", "/home/vagrant/ansible",
    create: true, type: :rsync, owner: :vagrant, group: :vagrant

  config.vm.provider :virtualbox do |vb|
    vb.gui    = false
    vb.memory = 1024 * 2
    vb.cpus   = 2
  end

  config.vm.define :atago do |machine|
    machine.vm.hostname = "atago"
    machine.vm.network "private_network", ip: "#{ENV['ATAGO_IP'] || '192.168.33.11'}"
    machine.vm.provider :virtualbox do |vb|
      vb.name = "atago"
    end
  end

  config.vm.define :ise do |machine|
    machine.vm.hostname = "ise"
    machine.vm.network "private_network", ip: "#{ENV['ISE_IP'] || '192.168.33.12'}"
    machine.vm.provider :virtualbox do |vb|
      vb.name = "ise"
    end
  end

  config.vm.define :umikaze do |machine|
    machine.vm.hostname = "umikaze"
    machine.vm.network "private_network", ip: "#{ENV['UMIKAZE_IP'] || '192.168.33.13'}"
    machine.vm.provider :virtualbox do |vb|
      vb.name = "umikaze"
    end
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook       = "/home/vagrant/ansible/main.yml"
    ansible.inventory_path = "/home/vagrant/ansible/inventories/hosts"
    ansible.version        = "latest"
    ansible.limit          = "my-hosts"
    ansible.verbose        = false # デバッグしない
    ansible.install        = true  # Ansibleを自動インストールする
  end
end
