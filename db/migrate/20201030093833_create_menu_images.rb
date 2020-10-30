class CreateMenuImages < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_images do |t|
      t.references :menu, foreign_key: true
      t.string :image, null: false
      t.timestamps
    end
  end
end
