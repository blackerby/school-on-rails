require 'csv'

meetings_text = File.read(Rails.root.join('lib', 'seeds', 'meetings.csv'))
meetings_csv = CSV.parse(meetings_text, headers: true)

puts 'Destroying all meetings'
Meeting.destroy_all

meetings_csv.each do |row|
  m = Meeting.create!(row.to_h)
  puts "#{m.teacher.name}'s #{m.block.name} block class #{m.course_title} in #{m.classroom.name} saved"
end
