require 'rails_helper'

RSpec.describe Flag, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:comment) }
end
