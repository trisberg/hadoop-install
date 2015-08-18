VM_MEMORY = "4096"
MANAGE_HOST = true
HOST_NAME = "borneo"

Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.5"

  # Set and manage hostname
  config.vm.network "private_network", type: "dhcp"
  config.vm.hostname = HOST_NAME
  config.hostmanager.enabled = true
  # config.vm.provision :hostmanager
  config.hostmanager.manage_host = MANAGE_HOST
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.ip_resolver = proc do |machine|
    result = ""
    begin
      machine.communicate.execute("ifconfig eth1") do |type, data|
        result << data if type == :stdout
      end
      (ip = /inet addr:(\d+\.\d+\.\d+\.\d+)/.match(result)) && ip[1]
    rescue
      result = "# NOT-UP"
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = VM_MEMORY
    vb.name = "Hadoop-" + HOST_NAME
  end

  # Hack fixing issue where `hostname` always ends up resolving to 127.0.0.1
  config.vm.provision "shell", inline: <<-SHELL
    sed -i "s/`hostname` localhost/localhost/g" /etc/hosts
  SHELL
  # Install Java
  config.vm.provision "shell", inline: <<-SHELL
    echo Installing Java ...
    yum -y -q install java-1.7.0-openjdk-devel
  SHELL
  # Set up and install Hadoop
  config.vm.provision :shell, path: "passwordless_ssh.sh", privileged: false
  config.vm.provision :shell, path: "install_hadoop.sh", privileged: false
  config.vm.provision :shell, path: "install_hive.sh", privileged: false
  config.vm.provision :shell, path: "install_hsqldb.sh", privileged: false
  # Start Hadoop and Hive during 'vagrant up'
  config.vm.provision :shell, path: "start_hadoop.sh", run: "always", privileged: false
  config.vm.provision :shell, path: "start_hive.sh", run: "always", privileged: false
  config.vm.provision :shell, path: "start_hsqldb.sh", run: "always", privileged: false
  # Set Hadoop directory permissions
  config.vm.provision :shell, path: "directory_permissions.sh", privileged: false

end
