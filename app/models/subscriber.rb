class Subscriber < ActiveRecord::Base
  belongs_to :campaign, dependent: :destroy

  validates :email, presence: true
  validates :source, presence: true
  validates_numericality_of :sends, only_integer: true
  validates_numericality_of :opens, only_integer: true
  validates_numericality_of :replies, only_integer: true
  validates_numericality_of :clicks, only_integer: true

  def self.search(search)
    where('email LIKE ? OR first_name LIKE ? OR last_name LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
