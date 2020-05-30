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


frontend_application_data = {
  name: 'Frontend',
  uid: '0247a214-bba6-42e6-a5f6-baaf4b8259e5',
  secret: 'ShW0tK3qOjpaRLHcELsE8eLV5IJXTaIYmGiQ8s8NHXY',
  owner: admin
}


mobile_application_data = {
  name: 'Mobile',
  uid: 'a0f68337-5d20-40d6-91ab-e4841e3c99bf',
  secret: 'fwJXviKrxiMoyxIjSKVuDOGMUl6WG1AHabeTu9rlu40',
  owner: admin
}

applications_data = [frontend_application_data, mobile_application_data]

puts "\nApplications created:"

applications_data.each do |application_data|
  OAuth::Application.create(
    name: application_data[:name],
    uid: application_data[:uid],
    secret: ::Doorkeeper::SecretStoring::BCrypt.transform_secret(application_data[:secret]),
    owner: application_data[:owner]
  )

  puts "Application: #{application_data[:name]}\tUUID: #{application_data[:uid]}\tSecret: #{application_data[:secret]}"
end
