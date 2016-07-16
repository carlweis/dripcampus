class Message < ActiveRecord::Base
  belongs_to :campaign
  
  validates :subject, presence: true
  validates :body, presence: true
  validates :delay, presence: true
  validates :interval, presence: true, inclusion: ['minutes', 'hours', 'days', 'weeks']
end
