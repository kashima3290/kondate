class CreateMenuHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_histories do |t|
      t.references :menu, foreign_key: true, :null => false
      t.timestamp :eating_date, :null => false
      t.timestamps
    end
  end
end
