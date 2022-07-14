Vagrant.configure("2") do |config|

  config.vm.define "web01" do |web01|
    web01.vm.box = "geerlingguy/ubuntu2004"
    web01.vm.network "private_network", ip: "192.168.56.13"
    web01.vm.provider "virtualbox" do |vb|
       vb.memory = "1024"
       vb.cpus = 2
   end
  web01.vm.provision "shell", inline: <<-SHELL
    apt update
    apt install apache2 wget unzip -y
    systemctl start apache2
    systemctl enable apache2
    cd /tmp/
    wget https://www.tooplate.com/zip-templates/2127_little_fashion.zip
    unzip -o  2127_little_fashion.zip
    cp -r 2127_little_fashion/* /var/www/html
    systemctl restart httpd
   SHELL

  end

  config.vm.define "db01" do |db01|
    db01.vm.box = "centos/7"
    db01.vm.network "private_network", ip: "192.168.56.14"
    db01.vm.provider "virtualbox" do |vb|
       vb.memory = "1024"
       vb.cpus = 2
   end
    db01.vm.provision "shell", inline: <<-SHELL
    yum install mariadb-server -y
    systemctl start mariadb
    systemctl enable maria db

    mysql -u root -e 'CREATE DATABASE wordpress;'
    mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "panda123";'
    mysql -u root -e 'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;'
    mysql -u root -e 'FLUSH PRIVILEGES;'

    SHELL
  end

end
