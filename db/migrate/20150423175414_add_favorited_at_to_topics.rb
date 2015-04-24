class AddFavoritedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :favorited_at, :datetime
  end
end
