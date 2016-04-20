#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P dnf 2>&1 || type -P yum) --disablerepo=updates "${@}"
}

rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/7/x86_64/e/epel-release-7-6.noarch.rpm

# Add installation packages ...
addpkgs="
  @development
  libyaml-devel
  libyaml-devel
  oepnssl-devel
  zlib-devel
  libxml2-devel
  nodejs
  npm
"

rm -f /etc/yum/vars/releasever

# need this ?
yum clean all

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi
