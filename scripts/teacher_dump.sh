#!/bin/sh

sqlite3 ../db/production.sqlite3 <<EOF
.headers on
.mode csv
.output teachers.csv
SELECT * FROM teachers;
.quit
EOF
