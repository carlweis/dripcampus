require 'rails_helper'

RSpec.describe Campaign, type: :model do

  # validations
  it { should validate_presence_of(:name) }

  # associations
  it { should belong_to(:user) }
  it { should have_many(:subscribers) }
end
