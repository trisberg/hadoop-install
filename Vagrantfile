Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.5"
  config.vm.define "borneo" do |borneo| end

  # Set and manage hostname
  config.vm.network "private_network", type: "dhcp"
  config.vm.hostname = 'borneo'
  config.hostmanager.enabled = true
  # config.vm.provision :hostmanager
  config.hostmanager.manage_host = true
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
    vb.memory = "2048"
    vb.name = "Hadoop-borneo"
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
  # Start Hadoop during 'vagrant up'
  config.vm.provision :shell, path: "start_hadoop.sh", run: "always", privileged: false

end
