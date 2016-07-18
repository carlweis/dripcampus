require 'rails_helper'

RSpec.describe Message, type: :model do

  # validations
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:wait) }
  it { should validate_presence_of(:interval) }
  it { should validate_inclusion_of(:interval).
       in_array(['minutes', 'hours', 'days', 'weeks']) }

  # associations
  it { should belong_to(:campaign) }

end
