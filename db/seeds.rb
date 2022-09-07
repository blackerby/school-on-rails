# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

Department.create([{ name: 'English' }, { name: 'History' },
                   { name: 'Math' }, { name: 'Science' },
                   { name: 'Fine Arts' }, { name: 'Modern & Classical Languages' },
                   { name: 'Physical Education' }, { name: 'Computer Science' }])

('A'..'G').each { |letter| Block.create({ name: letter }) }
Block.create({ name: 'Evening' })

faculty_text = File.read(Rails.root.join('lib', 'seeds', 'faculty.csv'))
faculty_csv = CSV.parse(faculty_text, headers: true)

faculty_csv.each do |row|
  t = Teacher.create!(
    email: row['email'],
    first_name: row['first_name'],
    last_name: row['last_name'],
    department_id: row['department_id']
  )
  puts "#{t.first_name} #{t.last_name} saved"
end

classrooms_text = File.read(Rails.root.join('lib', 'seeds', 'classrooms.csv'))
classrooms_csv = CSV.parse(classrooms_text, headers: true)

classrooms_csv.each do |row|
  c = Classroom.create!(row.to_h)
  puts "#{c.name} saved"
end

meetings_text = File.read(Rails.root.join('lib', 'seeds', 'meetings.csv'))
meetings_csv = CSV.parse(meetings_text, headers: true)

meetings_csv.each do |row|
  m = Meeting.create!(row.to_h)
  puts "#{m.teacher.name}'s #{m.block.name} block class in #{m.classroom.name} saved"
end
