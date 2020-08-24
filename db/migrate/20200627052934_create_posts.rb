class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :image
      t.text :title, null: false
      t.text :page
      t.text :line
      t.text :content, null: false
      t.integer :likes_count
      t.timestamps
    end
  end
end