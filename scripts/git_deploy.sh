#!/bin/sh

ssh app@51.140.162.169 <<EOF
  su app
  kill -9 $(lsof -ti tcp:3000)
  cd ~/AWS_VM_References
  git pull
  cd webapp
  rake db:migrate
  rails s -p 3000 -b 0.0.0.0 -d
EOF

