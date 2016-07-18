require 'ffaker'

## clear data
Message.delete_all
Subscriber.delete_all
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
50.times do |i|
	campaign = Campaign.create!(
		user: user,
		name: "#{FFaker::Job.title}-#{i}",
		description: FFaker::HipsterIpsum.paragraph,
		tags: FFaker::HipsterIpsum.words(5).join(', '),
		active: FFaker::Boolean.random
	)

  25.times do |j|
    random_email = "#{FFaker::Name.first_name}#{j}@#{FFaker::Internet.domain_name}"
    Subscriber.create!(
      campaign: campaign,
      email: random_email,
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      source: FFaker::Internet.http_url,
      sends: rand(50),
      opens: rand(50),
      replies: rand(50),
      clicks: rand(50),
      opt_out: FFaker::Boolean.random
    )
  end

	10.times do |k|
		Message.create!(
			campaign: campaign,
			subject: FFaker::Lorem.sentence,
			body: FFaker::HTMLIpsum.body,
			wait: rand(10),
			interval: 'minutes'
		)
	end
end
