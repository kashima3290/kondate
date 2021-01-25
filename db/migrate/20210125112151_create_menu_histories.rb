class CreateMenuHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_histories do |t|

      t.timestamps
    end
  end
end
