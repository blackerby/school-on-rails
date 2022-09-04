# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
departments = Department.create([{ name: 'English' }, { name: 'History' },
                                 { name: 'Math' }, { name: 'Science' },
                                 { name: 'Fine Arts' }, { name: 'Modern & Classical Languages' },
                                 { name: 'Physical Education' }, { name: 'Computer Science' }])

teachers = Teacher.create([{ first_name: 'William', last_name: 'Blackerby',
                             email: 'william.blackerby@indiansprings.org',
                             department: Department.find(6) },
                           { first_name: 'William', last_name: 'Belser',
                             email: 'william.belser@indiansprings.org',
                             department: Department.find(8) },
                           { first_name: 'Jonathan', last_name: 'Horn',
                             email: 'jhorn@indiansprings.org',
                             department: Department.find(6) }])

blocks = ('A'..'G').each { |letter| Block.create({ name: letter }) }

classrooms = (1..17).each { |room| Classroom.create({ name: room.to_s }) }
