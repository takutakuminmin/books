class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :author
      t.text :page
      t.text :line
      t.text :content
      t.integer :likes_count
      t.timestamps
    end
  end
end