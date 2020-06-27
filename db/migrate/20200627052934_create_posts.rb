class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :image
      t.text :title
      t.integer :page
      t.integer :line
      t.text :content
      t.timestamps
    end
  end
end