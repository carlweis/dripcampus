# DripCampus
Drip campaign email marketing tool, which allows schools to
sign up for an account, and then create email campaigns, and then
define events/triggers which will queue up a campaign.

In-order for a school to say start a new student campaign, each time a
new student signs up on their website; they would create a new_student_signup
event, and then add a trigger for the campaign they want to run, such as a
new_student_signup_campaign.

This allows the integration with existing sites/applications, using a
dynamic RESTful API, to call the trigger events, which will kick off one or
more campaigns.

## Authentication - Sign up / Sign in
User authentication is handled using Devise for Rails, as it allows the focus
to be on the actual application logic and implementation. If the authentication
system needs to be more fined tuned, then we can replace devise with a custom
implementation at that time.

## Events
Events and triggers could be Sign Up, Login, Purchase Item, etc.
The goal was to make it so it could be easily integrated into existing
custom Rails applications. It could of course be extended further to allow
easy integration in any platform.

## Dynamic API
The core of the system is the dynamic RESTful api endpoints, for each user.
These custom endpoints allow the triggering of events, which initialize a new
campaign for a given email address.

## Campaigns
Campaigns can be thought of as containers for a set of mail messages.

## Messages
Each campaign can have one or more mail messages associated with it.
Every mail message has a delay attribute, which is how long to wait before
sending the message.

This allows messages in the queue to be sent, one after the other,
with a delay in-between messages.

## Queued Jobs
All campaign mail jobs are queued, so that they are sent using a background
queuing service, such as Sidekick or Resque.
