DB="db/development.sqlite3"
DB_PATH="db"
BKUP_PATH="backup"
BKUP_DB="backup/development.sqlite3.bk"
LOG="backup/development_backup.log"

# check to see if $DB exists
if [ ! -f $DB ]
then
    echo $(date +"%Y-%m-%d %T") -- cannot find the database at the following path: $DB >> $LOG
    cp $BKUP_DB $DB_PATH/$(basename $DB)
    exit 1
fi

exit 0
