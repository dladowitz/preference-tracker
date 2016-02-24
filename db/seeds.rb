# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create [{first_name: "David",  last_name: "Ladowitz", email: "david@ladowitz.com", admin: true,  password: "asdfasdf"},
                     {first_name: "Teresa", last_name: "Huang",    email: "teresa@gmail.com",   admin: false, password: "asdfasdf"}
                    ]
