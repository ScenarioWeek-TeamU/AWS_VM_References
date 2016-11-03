#!/bin/sh

ssh app@51.140.162.169 <<EOF
  cd ~/AWS_VM_References
  git fetch --all
  git reset --hard origin/master
EOF

