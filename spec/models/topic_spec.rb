require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe 'associations' do
    it { should belong_to(:user)}
    it { should have_many(:comments) }
    it { should have_many(:favorites) }
    it { should have_many(:favoriters).through(:favorites) }
  end

end
