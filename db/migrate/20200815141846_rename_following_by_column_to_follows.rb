class RenameFollowingByColumnToFollows < ActiveRecord::Migration[5.2]
  def change
    rename_column :follows, :following_by_id, :followed_by_id
  end
end
