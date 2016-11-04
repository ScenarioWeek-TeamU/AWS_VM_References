#!/bin/bash

(crontab -l 2>/dev/null; echo "* * * * * /home/app/AWS_VM_References/webapp/backup.sh") | crontab -

