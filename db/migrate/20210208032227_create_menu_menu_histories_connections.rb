class CreateMenuMenuHistoriesConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_menu_histories_connections do |t|

      t.timestamps
    end
  end
end
