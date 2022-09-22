#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

echo "Getting csv files from database"
./blocks_dump.sh
./classrooms_dump.sh
./teacher_dump.sh

echo "Wrangling data"
python3 refresh.py

echo "Copying wrangled data to seeds"
cp meetings.csv ../lib/seeds/

echo "Resetting test database"
../bin/rails db:reset RAILS_ENV=test

echo "Seeding meetings in development database"
../bin/rails db:seed:meetings RAILS_ENV=development

echo "Cleaning up generated csvs"
rm meetings.csv blocks.csv classrooms.csv teachers.csv
