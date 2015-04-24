class AddFlaggedAtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :flagged_at, :datetime
  end
end
