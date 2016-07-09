require 'faker'


## Seed Demo User
user = User.create!(
	account_id: SecureRandom.uuid,
	email: 'demo@dripcampus.com',
	password: 'password',
	password_confirmation: 'password',
	confirmed_at:  DateTime.now
)

## Seed Prospects
grades = [
	'A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-',
	'D', 'D-', 'F'
]
20.times do
	Prospect.create!(
		user_id: user.id,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		company: Faker::Company.name,
		phone: Faker::PhoneNumber.phone_number,
		score: rand(500),
		grade: grades[rand(grades.count)],
		assigned_to: Faker::Name.name,
		notes: Faker::Lorem.paragraph(2)
	)
end
