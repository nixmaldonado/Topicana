require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:flags) }
    it { should have_many(:topics)}
    it { should have_many(:comments)}
    it { should have_many(:favorites)}
    it { should have_many(:flagged_comments).through(:flags)}
    it { should have_many(:favorited_topics).through(:favorites)}
  end

# Favorite tests

  describe '#fav_topic!' do
    before do
      @user  = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
    end

    context 'when topic not already favorited' do
      before do
        @user.fav_topic!(@topic)
      end

      it 'favorites a topic' do
        result = @user.favorited_topics.find_by_id(@topic)
        expect(result).to eq(@topic)
      end
    end

    context 'when topic already faved' do
      before do
        @user.fav_topic!(@topic)
      end

      it 'returns nil' do
        result =  @user.fav_topic!(@topic)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#unfav_topic!' do
    before do
      @user  = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
    end

    context 'when a topic is already favorite' do
      before do
        @user.fav_topic!(@topic)
      end

      it 'unfavorites a topic' do
        @user.unfav_topic!(@topic)
        result = @user.favorited_topics.include?(@topic)
        expect(result).to eq(false)
      end
    end

    context 'when a topic is not favorited' do
      it 'returns nil' do
        result = @user.unfav_topic!(@topic)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#already_favorited?' do
    before do
      @user  = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
    end

    it 'returns topic if topic already favorited' do
      @user.favorited_topics << @topic
      result = @user.already_favorited?(@topic)
      expect(result).to eq(@topic)
    end
  end

#  Flag tests

  describe '#flag_comment!' do
    before do
      @user    = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment)
    end

    context 'when a comment is not flagged' do
      it 'flags a comment' do
        @user.flag_comment!(@comment)
        result = @user.flagged_comments.include?(@comment)
        expect(result).to eq(true)
      end
    end

    context 'when a comment is already flagged' do
      it 'returns nil' do
        @user.flagged_comments << @comment
        result = @user.flag_comment!(@comment)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#unflag_comment!' do
    before do
      @user    = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment)
    end

    context 'when a comment is already flagged'do
      before do
        @user.flagged_comments << @comment
      end

      it 'unflags the comment' do
        @user.unflag_comment!(@comment)
        result = @user.flagged_comments.include?(@comment)
        expect(result).to eq(false)
      end
    end

    context 'when a comment is not flagged' do
      it 'returns nil' do
        result = @user.unflag_comment!(@comment)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#aleady_flagged?' do
    before do
      @user    = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment)
    end

    context 'when the comment is not flagged' do
      it 'returns nil' do
        result = @user.already_flagged?(@comment)
        expect(result).to eq(nil)
      end
    end

    context 'when the comment is flagged' do
      before do
        @user.flagged_comments << @comment
      end

      it 'returns the comment' do
        result = @user.already_flagged?(@comment)
        expect(result).to eq(@comment)
      end
    end
  end

end
