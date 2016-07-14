require 'ffaker'

## clear data
Campaign.delete_all
User.delete_all

## Seed Demo User
user = User.create!(
	account_id: SecureRandom.uuid,
	email: 'demo@dripcampus.com',
	password: 'password',
	password_confirmation: 'password',
	confirmed_at:  DateTime.now
)

## Seed campaigns
25.times do |i|
	Campaign.create!(
		user: user,
		name: "#{FFaker::Job.title}-#{i}",
		description: FFaker::HipsterIpsum.paragraph,
		tags: FFaker::HipsterIpsum.words(5).join(', '),
		active: true
	)
end
