#!/bin/bash

(crontab -l 2>/dev/null; echo "* * * * * /home/teamu/AWS_VM_References/webapp/backup.sh") | crontab -

