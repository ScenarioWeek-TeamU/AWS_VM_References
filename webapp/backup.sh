#!/bin/bash


s3cmd -r put /home/teamu/AWS_VM_References/webapp/backup/ s3://database-backup-scenario-week-3/backup-$(date +%d-%m-%Y/%H:%M:%S)/ 2>&1
