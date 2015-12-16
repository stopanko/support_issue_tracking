# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

ProblemType.find_or_create_by(name: "Network")
ProblemType.find_or_create_by(name: "OS")
ProblemType.find_or_create_by(name: "My Hands")

Status.find_or_create_by(name: "Waiting for Staff Response", costumer_default: true)
Status.find_or_create_by(name: "Waiting for Customer", admin_default: true)
Status.find_or_create_by(name: "On Hold")
Status.find_or_create_by(name: "Cancelled")
Status.find_or_create_by(name: "Completed")