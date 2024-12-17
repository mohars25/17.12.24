require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

# Users
10.times do
  User.create(
    email: Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence
  )
end

# Events
users = User.all
5.times do
  Event.create(
    start_date: Faker::Time.forward(days: 23, period: :evening),
    duration: [30, 60, 90, 120].sample,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    price: rand(1..1000),
    location: Faker::Address.city,
    user: users.sample
  )
end

# Attendances
events = Event.all
events.each do |event|
  rand(1..5).times do
    Attendance.create(
      stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10),
      user: users.sample,
      event: event
    )
  end
end
