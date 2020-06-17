class CreateNotetags < ActiveRecord::Migration[6.0]
  def change
    create_table :notetags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
