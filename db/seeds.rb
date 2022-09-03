# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
teachers = Teacher.create([{ first_name: 'William', last_name: 'Blackerby',
                             email: 'william.blackerby@indiansprings.org' },
                           { first_name: 'William', last_name: 'Belser',
                             email: 'william.belser@indiansprings.org' },
                           { first_name: 'Jonathan', last_name: 'Horn',
                             email: 'jhorn@indiansprings.org' }])
