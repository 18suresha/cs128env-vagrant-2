#!/usr/bin/env bash

APT_FLAGS="-qq -y -o Dpkg::Use-Pty=0"
export DEBIAN_FRONTEND=noninteractive

apt-get $APT_FLAGS update
apt-get $APT_FLAGS install build-essential python3-pip

apt-get $APT_FLAGS install curl sqlite3

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh 10

# install and configure clang-10, libc++abi-dev, and libc++-dev
apt-get $APT_FLAGS install libc++abi-dev libc++-dev clangd-10 llvm-10-dev liblldb-10-dev
ln -sf /usr/bin/clang-10 /usr/bin/clang
ln -sf /usr/bin/clang++-10 /usr/bin/clang++
ln -sf /usr/bin/lldb-10 /usr/bin/lldb
ln -sf /usr/bin/clangd-10 /usr/bin/clangd
ln -sf /usr/bin/lldb-server-10 /usr/bin/lldb-server-10.0.1
# update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
# update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100
# update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-10 100
# update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

# other utilities
apt-get $APT_FLAGS install clang-format-10 clang-tidy-10 cppcheck uncrustify catch
ln -sf /usr/bin/clang-format-10 /usr/bin/clang-format
ln -sf /usr/bin/clang-tidy-10 /usr/bin/clang-tidy
# update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100
# update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 100

apt-get $APT_FLAGS install make cmake git vim nano gedit manpages-dev gdb lldb-10 valgrind graphviz imagemagick gnuplot # xorg

git clone https://github.com/lldb-tools/lldb-mi.git
cd lldb-mi
cmake .
cmake --build .
cp src/lldb-mi /usr/bin/
cd ../
rm -rf lldb-mi

# other configuration
sudo ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
dpkg-reconfigure tzdata 2>&1

ln -sf /vagrant/.config/clang-tidy /home/vagrant/.clang-tidy
ln -sf /vagrant/.config/clang-format /home/vagrant/.clang-format
ln -sf /vagrant/.vscode /home/vagrant/.vscode

# for visual debugging
mkdir /home/vagrant/bin/
sudo chown -R vagrant:vagrant /home/vagrant/bin/

echo 'curl https://sh.rustup.rs -sSf | sh -s -- -y;' | su vagrant

# grep -qxF 'ForwardX11 yes' /etc/ssh/ssh_config || echo '    ForwardX11 yes' >> /etc/ssh/ssh_config
# grep -qxF 'ForwardX11Trusted yes' /etc/ssh/ssh_config || echo '    ForwardX11Trusted yes' >> /etc/ssh/ssh_config
