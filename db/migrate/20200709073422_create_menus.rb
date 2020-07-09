class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.string :site
      t.text :text
      t.timestamps
    end
  end
end
