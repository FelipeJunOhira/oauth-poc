# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\nCreating data for development environment..."

bob_user = User.create(email: 'bob@gmail.com', password: '123123')
john_user = User.create(email: 'john@gmail.com', password: '123123')

admin = Developer.create(email: 'dev@gmail.com', password: '123123')

frontend_application = Oauth::Application.create(
  name: 'Frontend',
  owner: admin
)

mobile_application = Oauth::Application.create(
  name: 'Mobile',
  owner: admin
)

applications = [frontend_application, mobile_application]

puts "\nApplications created:"

applications.each do |application|
  puts "Application: #{application.name}\tUUID: #{application.uid}\tSecret: #{application.plaintext_secret}"
end
