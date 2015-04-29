class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many   :flags
  has_many   :flaggers, through: :flag, source: :user

  validates :user, :body, presence: true
end
