#!/bin/sh

ssh app@51.140.162.169 <<EOF
  cd ~/AWS_VM_References
  git fetch --all
  git reset --hard origin/master
  cd webapp
  bundle install
  rake db:migrate RAILS_ENV=test
  rake test
EOF

ssh app@51.140.181.55 <<EOF
  cd ~/AWS_VM_References
  git fetch --all
  git reset --hard origin/master
EOF

