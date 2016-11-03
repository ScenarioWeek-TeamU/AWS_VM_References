#!/bin/sh

ssh app@51.140.162.169 <<EOF
  cd ~/AWS_VM_References/
  git pull
  rails s -p 3000 -b 0.0.0.0
EOF
