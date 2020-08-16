class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :following   , foreign_key: {to_table: :users}
      t.references :following_by, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
