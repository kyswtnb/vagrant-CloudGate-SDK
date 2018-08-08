
$script = <<-SCRIPT

CG_SDK_ARCHIVE="CloudGate-SDK-x86_64-v2.83.1.tar.bz2"
CG_SDK_VERSION="CloudGate-SDK-x86_64-v2.83.1"

# timezone JST
timedatectl set-timezone Asia/Tokyo

echo -e "\e[31m## package install\e[m"
sudo apt-get install -y ssh build-essential gawk zlib1g-dev git libncurses5-dev subversion lzop gengetopt flex zip autoconf python g++ ncurses-dev unzip subversion gettext libcurl4-gnutls-dev

echo -e "\e[31m## CloudGate\e[m"
tar xf /vagrant/${CG_SDK_ARCHIVE} -C /home/vagrant/

cp -v  /vagrant/build.sh             /home/vagrant/${CG_SDK_VERSION}

chown -R vagrant: /home/vagrant/${CG_SDK_VERSION}
SCRIPT

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  if Vagrant.has_plugin?("vagrant-vbguest") then
    # Guest Additions自動更新の無効化設定
    config.vbguest.auto_update = false
  end

  config.vm.box = "bento/ubuntu-16.04"

  # 共有フォルダの設定
  config.vm.synced_folder ".", "/vagrant",  create: true, owner: "vagrant", group: "vagrant"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define "vagrant" do |server|
    server.vm.hostname = "ubuntu-16.04-CloudGate"
    server.vm.network :private_network, ip: "192.168.33.36"

    config.vm.provision "shell",
      inline: $script

  end
end
