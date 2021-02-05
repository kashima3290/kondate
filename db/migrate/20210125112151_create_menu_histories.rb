class CreateMenuHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_histories do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :menu_id, null: false
      t.timestamp :eating_date, null: false
      t.timestamps
    end
    add_index :menu_histories, :menu_id
  end
end
