#!/bin/bash
set -euox pipefail

# Dumps details about the instance running the CI job.
echo -e "\033[0;36m"
cat << EOF
------------------------------------------------------------------------------
CI MACHINE SPECS
------------------------------------------------------------------------------
     Hostname: $(uname -n)
         User: $(whoami)
         CPUs: $(nproc)
          RAM: $(free -m | grep -oP '\d+' | head -n 1) MB
         DISK: $(df --output=size -h / | sed '1d;s/[^0-9]//g') GB
         ARCH: $(uname -m)
       KERNEL: $(uname -r)
------------------------------------------------------------------------------
EOF
echo -e "\033[0m"

# Get OS info
cat /etc/os-release

rpm -qa | grep -E 'fido|fdo'
sudo ls -lsa /var/share/test-artifacts

exit 0
