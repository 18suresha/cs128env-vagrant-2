# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_version = "1.0.282"
  config.ssh.forward_x11 = true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512
    vb.cpus = 1
    # vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
  end
  config.vm.provision "shell", inline: <<-SHELL

    apt-get update

    apt-get -y install build-essential
    apt-get -y install python3-pip

    # install and configure clang-10, libc++abi-dev, and libc++-dev
    apt-get -y install clang-10 libc++abi-dev libc++-dev clangd-10
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100
    update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-10 100
    update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

    # set clang-10 as the default compiler
    # update-alternatives --install /usr/bin/g++ c++ /usr/bin/clang-10 100

    # other utilities
    apt-get -y install clang-format-10 clang-tidy-10 cppcheck uncrustify
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 100

    apt-get -y install make cmake git
    apt-get -y install vim nano gedit manpages-dev
    apt-get -y install gdb lldb-10 valgrind
    apt-get -y install graphviz imagemagick gnuplot

    # for x-window forwarding
    apt-get -y install xorg

  SHELL

end