class CreateMenuMenuHistoriesConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_menu_histories_connections do |t|
      t.references :menu
      t.references :menu_histories
      t.timestamps
    end
  end
end
