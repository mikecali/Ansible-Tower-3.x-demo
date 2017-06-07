# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk0 = '.disks/large_disk0.vdi'
file_to_disk1 = '.disks/large_disk1.vdi'

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "client1",
      :box => "bento/centos-7.3",
      :ram => 2048,
      :vcpu => 1,
      :ip => "192.168.29.2"
    },
    {
      :name => "client2",
      :box => "bento/centos-7.3",
      :ram => 2048,
      :vcpu => 1,
      :ip => "192.168.29.3"
    },
    {
      :name => "ansible-host",
      :box => "nhalm/centos7-gui",
      :ram => 4048,
      :vcpu => 1,
      :ip => "192.168.29.4"
    }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#   Only Enable this if you are connecting to Proxy server
#      config.proxy.http     = "http://usernam:password@dnzwgpx2.datacom.co.nz:80"
#      config.proxy.https    = "http://usernam:password@dnzwgpx2.datacom.co.nz:80"
      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
      config.vm.provider :virtualbox do |v|
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      config.vm.network :private_network, ip: opts[:ip]

      # Provision both VMs using Ansible after the last VM is booted.
      if opts[:name] == "WLGLRCAL001"
      config.vm.provider :virtualbox do |vb|
       unless File.exist?(file_to_disk0)
          vb.customize ['createhd', '--filename', file_to_disk0, '--size', 20 * 1024]
          end
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk0]
        end
      end
      if opts[:name] == "WLGLEMAL001"
      config.vm.provider :virtualbox do |vb|
        unless File.exist?(file_to_disk1)
            vb.customize ['createhd', '--filename', file_to_disk1, '--size', 20 * 1024]
            end
          vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk1]
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :shell, path: "ansible-install.sh"
        config.vm.provision :shell, path: "host.sh"
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source     = 'tower/inventory'
        file.destination    = '/home/vagrant/ansible-tower-setup-bundle-3.1.2-1.el7/inventory'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :shell, path: "ansible-tower-install.sh"
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source     = 'keys/vagrant'
        file.destination    = '/home/vagrant/playbooks/keys/vagrant'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source     = 'tower/inventory'
        file.destination    = '/home/vagrant/ansible-tower-setup-bundle-3.1.2-1.el7/inventory'
        file.source         = 'playbooks/ping.yml'
        file.destination    = '/home/vagrant/playbooks/ping.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'payments-system-playbooks.mike.5.tar.gz'
        file.destination    = '/home/vagrant/payments-system-playbooks.mike.5.tar.gz'
        file.source         = 'playbooks/update_hostname.yml'
        file.destination    = '/home/vagrant/playbooks/update_hostname.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/ansible.cfg'
        file.destination    = '/home/vagrant/ansible.cfg'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/inventory'
        file.destination    = '/home/vagrant/inventory'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/mysql.yml'
        file.destination    = '/home/vagrant/playbooks/mysql.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/apache.yml'
        file.destination    = '/home/vagrant/playbooks/apache.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/verify-install.yml'
        file.destination    = '/home/vagrant/playbooks/verify-install.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/vars.yml'
        file.destination    = '/home/vagrant/playbooks/vars.yml'
        end
      end
      if opts[:name] == "ansible-host"
        config.vm.provision :file do |file|
        file.source         = 'playbooks/lamp.yml'
        file.destination    = '/home/vagrant/playbooks/lamp.yml'
        end
      end
    config.vm.provision :shell, path: "bootstrap-node.sh"
   end
  end
end
