#!/bin/sh

# change to production for final script
sqlite3 ../db/development.sqlite3 <<EOF
DELETE FROM meetings;
.quit
EOF
