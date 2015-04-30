require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should have_many(:flags) }
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
end
