class CreateMenuHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_histories do |t|
      t.references :menu, foreign_key: true
      t.timestamp :eating_date
      t.timestamps
    end
  end
end
