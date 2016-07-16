class Campaign < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def self.search(search)
    where('name LIKE ? OR tags LIKE ? OR description LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
