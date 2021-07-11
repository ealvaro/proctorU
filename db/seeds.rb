# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Time slots during the next 14 days

10.times do
  College.create!(
    name: Faker::University.name
  )
end

20.times do |index|
  Exam.create!(
    title: "Exam on #{Faker::GreekPhilosophers.unique.name}",
    college: College.find(index/2 + 1)
  )
end

40.times do |index|
  time = Faker::Time.forward(days: rand(1..14), period: :morning)
  ExamWindow.create!(
    exam: Exam.find(index/2 + 1),
    start_time: time,
    end_time: time + 1.hour
  )
end

10.times do |index|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    college: College.find(index + 1)
  )
end
