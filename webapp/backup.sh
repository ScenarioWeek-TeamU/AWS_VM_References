#!/bin/bash

s3cmd -r put /home/teamu/AWS_VM_References/webapp/backup/ s3://database-backup-scenario-week-3/backup-$(date +%d-%m-%Y/%H:%M:%S)/ > /var/log/myjob.log 2>&1
