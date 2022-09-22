#!/bin/sh

sqlite3 ../db/production.sqlite3 <<EOF
.headers on
.mode csv
.output blocks.csv
SELECT * FROM blocks;
.quit
EOF
