class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flags
  has_many :flagged_comments, through: :flags, source: :comment
  has_many :topics
  has_many :comments
  has_many :favorites
  has_many :favorited_topics, through: :favorites, source: :topic

  #FLAG

  def already_flagged?(comment)
    flagged_comments.find_by_id(comment.id)
  end

  def flag_comment!(comment)
    return if flagged_comments.find_by_id(comment.id)
    flagged_comments << comment
  end

  def unflag_comment!(comment)
    return unless flagged_comments.find_by_id(comment.id)
    flagged_comments.delete(comment)
  end

  #FAVORITE

  def already_favorited?(topic)
    favorited_topics.find_by_id(topic.id)
  end

  def fav_topic!(topic)
    return if favorited_topics.find_by_id(topic.id)
    favorited_topics << topic
  end

  def unfav_topic!(topic)
    return unless favorited_topics.find_by_id(topic.id)
    favorited_topics.delete(topic)
  end
end
