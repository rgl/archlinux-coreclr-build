#!/usr/sbin/bash

set -x # show all commands
set -e # bail on command errors

# general development tools
pacman -S --noconfirm --needed base-devel git

# yaourt
cat<<EOF>>/etc/pacman.conf
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch
EOF
pacman -Sy --noconfirm yaourt

# add normal user because some tools (e.g. makepkg) refuse to run as root
groupadd --system sudo
groupadd rgl
useradd -m -g rgl -s /usr/sbin/bash rgl
usermod -a -G sudo rgl
echo '%sudo ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/sudo-group

# CoreCLR dependencies
su rgl -c 'yaourt -S --noconfirm --needed clang cmake llvm lldb libunwind icu uuid lttng-ust'

#
# CoreCLR
# See https://github.com/dotnet/coreclr/blob/master/Documentation/building/linux-instructions.md

su rgl -c 'git clone https://github.com/dotnet/coreclr /tmp/coreclr'

# dump versions
uname -a
pacman -Q clang cmake llvm lldb libunwind icu uuid lttng-ust
su rgl -c 'cd /tmp/coreclr && git rev-parse HEAD'

# build the Release flavor
su rgl -c 'cd /tmp/coreclr && ./build.sh x64 Release clean'
