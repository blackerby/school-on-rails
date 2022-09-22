#!/bin/sh

sqlite3 ../db/production.sqlite3 <<EOF
.headers on
.mode csv
.output classrooms.csv
SELECT * FROM classrooms;
.quit
EOF
