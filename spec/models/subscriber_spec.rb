require 'rails_helper'

RSpec.describe Subscriber, type: :model do

  # validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:source) }
  it { should validate_numericality_of(:sends) }
  it { should validate_numericality_of(:opens) }
  it { should validate_numericality_of(:replies) }
  it { should validate_numericality_of(:clicks) }

  # associations
  it { should belong_to(:campaign) }
end
