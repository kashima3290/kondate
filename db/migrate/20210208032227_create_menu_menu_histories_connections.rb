class CreateMenuMenuHistoriesConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_menu_histories_connections do |t|
      t.references :menu, foreign_key: true, null: false
      t.references :menu_history, foreign_key: true, null: false
      t.timestamps
    end
  end
end
