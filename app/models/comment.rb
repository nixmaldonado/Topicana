class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many   :flaggeds, through: :users


  def flagged?
    flagged_at.present?
  end

  def flag!
    update_attributes(flagged_at: Time.now)
  end

  def unflag!
    update_attributes(flagged_at: nil)
  end

end
