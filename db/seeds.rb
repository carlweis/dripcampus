require 'faker'


## Seed Demo User
User.create!(
	account_id: SecureRandom.uuid,
	email: 'demo@dripcampus.com',
	password: 'password',
	password_confirmation: 'password',
	confirmed_at:  DateTime.now
)
