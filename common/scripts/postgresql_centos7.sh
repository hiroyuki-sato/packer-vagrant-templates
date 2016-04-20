#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

rpm -ivh https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm

function yum() {
  $(type -P dnf 2>&1 || type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
  postgresql95-server
  postgresql95-devel
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi

