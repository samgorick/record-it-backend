class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_user_id
      t.boolean :allow
      t.timestamps
    end
  end
end
